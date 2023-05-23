import 'dart:developer';

import 'package:amenities_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../model/my_cart_model.dart';
import '../model/user_model.dart';

class UserController extends GetxController {
  final RxList<UserModel> _allSeller = <UserModel>[].obs;
  List<UserModel> get allSeller => _allSeller;
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
    const name = 'Faraz'; // Replace with the actual name value from the text field
    const address = '123 Main Street'; // Replace with the actual address value from the text field
    const email = 'ahmadfaraz5260@gmail.com'; // Replace with the actual email value from the text field
    const contactNo = '0300-80007868'; // Replace with the actual contact number value from the text field
    final orderData = {
      'name': name,
      'address': address,
      'email': email,
      'contactNo': contactNo,
      'products': myCartProductList.map((product) {
        return {
          'user_id': product.addUserId,
          'productName': product.name,
          'quantity': product.quantity,
          'order_status': 'pending',
          'product_image': product.productImage,
          'product_user_id': product.productUserId,
          'created_at': DateTime.now().millisecondsSinceEpoch.toString(),
        };
      }).toList(),
    };
    try {
        kFireStore.collection(kCheckOutCollection).add(orderData).then((value)async{
        kShowSnackBar(context: Get.context!, message: 'Order Send Successfully', isSuccess: true);
        // Delete cart items
        QuerySnapshot cartItemsSnapshot = await kFireStore.collection(kCartItemCollection)
            .where('user_id', isEqualTo: kStorage.read(kUserId)?? '')
            .get();

        List<Future<void>> deleteFutures = [];
        for (DocumentSnapshot ds in cartItemsSnapshot.docs) {
          deleteFutures.add(ds.reference.delete());
        }

        await Future.wait(deleteFutures);
        log('Order placed successfully with ID: ${value.id}');
      });
    } catch (error) {
      kShowSnackBar(context: Get.context!, message: error.toString(), isSuccess: true);
      log('Error placing order: $error');
    }
    update();
  }



  @override
  void onReady() {
    super.onReady();
    fetchAllSeller();
  }
}
