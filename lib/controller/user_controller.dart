import 'dart:developer';

import 'package:amenities_app/constant.dart';
import 'package:amenities_app/screens/user_screens/user_main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/my_cart_model.dart';
import '../model/order_model.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  final RxList<UserModel> _allSeller = <UserModel>[].obs;
  List<UserModel> get allSeller => _allSeller;
  final RxList<OrderModel> myOrdersList = <OrderModel>[].obs;
  final List<OrderModel>  _myPendingOrders  = <OrderModel>[].obs;
  int get myPendingOrders => _myPendingOrders.length;
  int get sellerOrders => myOrdersList.length;
  List<OrderModel> myOrders = [];
  void fetchAllSeller() {
    kShowLoading(Get.context!);
    kFireStore
        .collection(kUserCollection)
        .where(kUserType, isEqualTo: 'Seller')
        .snapshots()
        .listen((querySnapshot) {
      _allSeller.assignAll(
          querySnapshot.docs.map((e) => UserModel.fromJson(e.data())).toList());
      Get.back();
      update();
    }, onError: (error) {
      Get.back();
      kShowSnackBar(
          context: Get.context!, message: error.toString(), isSuccess: true);
    });
  }
  void sendOrder(RxList<MyCartProduct> myCartProductList) async {
    kShowLoading(Get.context!);
    final orderData = {
      'user_name': nameController.text,
      'address': addressController.text,
      'user_email': emailController.text,
      'user_phone': contactNoController.text,
      'user_id': kStorage.read(kUserId) ?? '',
      'order_status': 0,
      'product_user_id': myCartProductList.first.productUserId,
      'products': myCartProductList.map((product) {
        return {
          'user_id': product.addUserId,
          'productName': product.name,
          'quantity': product.quantity,
          'product_image': product.productImage,
          'product_user_id': product.productUserId,
          'created_at': DateTime.now().millisecondsSinceEpoch.toString(),
        };
      }).toList(),
    };
    try {
      if (nameController.text.isEmpty ||
          addressController.text.isEmpty ||
          emailController.text.isEmpty ||
          contactNoController.text.isEmpty) {
        Get.back();
        kShowSnackBar(
            context: Get.context!,
            message: 'Please fill all the fields',
            isSuccess: false);
      } else {
        kFireStore
            .collection(kOrderCollection)
            .add(orderData)
            .then((value) async {
          kShowSnackBar(
              context: Get.context!,
              message: 'Order Send Successfully',
              isSuccess: true);
          fetchMyOrders();
          // Delete cart items
          QuerySnapshot cartItemsSnapshot = await kFireStore
              .collection(kCartItemCollection)
              .where('user_id', isEqualTo: kStorage.read(kUserId) ?? '')
              .get();
          List<Future<void>> deleteFutures = [];
          for (DocumentSnapshot ds in cartItemsSnapshot.docs) {
            deleteFutures.add(ds.reference.delete());
          }
          await Future.wait(deleteFutures);
          Get.offAll(() => const UserMainScreen());
        });
      }
    } catch (error) {
      Get.back();
      kShowSnackBar(
          context: Get.context!, message: error.toString(), isSuccess: true);
      log('Error_placing_order: $error');
    }
    update();
  }
  void fetchMyOrders() async {
    kShowLoading(Get.context!);
    myOrdersList.clear();
    kFireStore
        .collection(kOrderCollection)
        .where('user_id', isEqualTo: kStorage.read(kUserId) ?? '')
        .snapshots()
        .listen((snapshot) {
      myOrders.clear();
      for (var doc in snapshot.docs) {
        OrderModel orders = OrderModel.fromFirestore(doc);
        myOrders.add(orders);
      }
      myOrdersList.assignAll(myOrders);
      Get.back();
      update();
    }, onError: (error) {
          Get.back();
      kShowSnackBar(context: Get.context!, message: error.toString(), isSuccess: false);
    });
    update();
  }
  void fetchSellerOrders() {
    myOrdersList.clear();
    _myPendingOrders.clear();
    kFireStore
        .collection(kOrderCollection)
        .where('product_user_id', isEqualTo: kStorage.read(kUserId) ?? '')
        .snapshots()
        .listen((snapshot) {
      myOrders.clear();
      for (var doc in snapshot.docs) {
        OrderModel orders = OrderModel.fromFirestore(doc);
        orders.orderStatus == 0 || orders.orderStatus == 1
            ? _myPendingOrders.add(orders)
            : null;
        myOrders.add(orders);
      }
      myOrdersList.assignAll(myOrders);
      update();
    }, onError: (error) {
      kShowSnackBar(context: Get.context!, message: error.toString(), isSuccess: true);
    });
    update();
  }
  void fetchAdminAllOrders() async{
    kShowLoading(Get.context!);
    myOrdersList.clear();
    kFireStore
        .collection(kOrderCollection)
        .snapshots()
        .listen((snapshot) {
      myOrders.clear();
      for (var doc in snapshot.docs) {
        OrderModel orders = OrderModel.fromFirestore(doc);
        myOrders.add(orders);
      }
      myOrdersList.assignAll(myOrders);
      Get.back();
      update();
    }, onError: (error) {
      Get.back();
      kShowSnackBar(context: Get.context!, message: error.toString(), isSuccess: false);
    });
    update();
  }
  confirmOrder({required String id, required int status}){
    kFireStore.collection(kOrderCollection).doc(id).update({
      'order_status': status,
    }).then((value) {
      fetchSellerOrders();
      kShowSnackBar(
          context: Get.context!,
          message: 'Product Confirmed Successfully',
          isSuccess: true);
      update();
    }).catchError((error) {
      kShowSnackBar(context: Get.context!, message: error, isSuccess: true);
    });
    update();
  }

  @override
  void onReady() {
    super.onReady();
    fetchAllSeller();
    if(kStorage.read(kUserType) == 'User'){
      log('this_is_user');
      fetchMyOrders();
    } else if(kStorage.read(kUserType) == 'Seller'){
      log('this_is_seller');
      fetchSellerOrders();
    } else {
      log('this_is_admin');
      fetchAdminAllOrders();
    }

  }
}
