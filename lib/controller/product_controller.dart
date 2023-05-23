import 'dart:developer';
import 'dart:io';

import 'package:amenities_app/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/cart_item_model.dart';
import '../model/my_cart_model.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  RxList<Product> productList = RxList<Product>();
  List<Product> products = [];
  final ImagePicker _picker = ImagePicker();
  TextEditingController productNameController = TextEditingController();
  RxBool isProductLoading = false.obs;
  File? image;
  RxInt _userProductsCount = 0.obs;
  get userProductCount => _userProductsCount.value;
  RxList<MyCartProduct> myCartProductList = RxList<MyCartProduct>();
  List<MyCartProduct> myCartProducts = [];
  RxBool isCartProductLoading = false.obs;
TextEditingController myCartQuantityController = TextEditingController();
  CartItem? cartItem;
 void pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      update();
    }
  }
 void removeImage(){
    image = null;
    update();
  }
 void addProduct({required String userId}) async {
    kShowLoading(Get.context!);
    if (productNameController.text.isEmpty) {
      Get.back();
      kShowSnackBar(
          context: Get.context!,
          message: 'Please enter product name',
          isSuccess: false);
    } else if (image != null) {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = kStorageRef.ref().child('$kProductCollection/$imageName.jpg');
      UploadTask uploadTask = ref.putFile(image!);
      TaskSnapshot storageSnapshot = await uploadTask;
      String imageUrl = await storageSnapshot.ref.getDownloadURL();
      kFireStore.collection(kProductCollection).doc().set({
        "createdAt": DateTime.now(),
        "product_name": productNameController.text,
        "userId": kStorage.read(kUserId) ?? '',
        "image": imageUrl,
        "status": "available",
      }).then((value) {
        getProducts(userId: userId);
        update();
        Get.back();
        Get.back();
        productNameController.clear();
        image = null;
        kShowSnackBar(
            context: Get.context!,
            message: 'Product Add Successfully',
            isSuccess: true);
      });
    } else {
      Get.back();
      kShowSnackBar(
          context: Get.context!,
          message: 'Please select an image',
          isSuccess: false);
    }
    update();
  }
 void getProducts({required String userId}) {
    productList.clear();
    isProductLoading(true);
    kFireStore
        .collection(kProductCollection)
        .where('userId', isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
      products.clear();
      for (var doc in snapshot.docs) {
        Product product = Product.fromSnapshot(doc);
        products.add(product);
      }
      productList.assignAll(products);
      isProductLoading(false);
      update();
    });
  }
  Future<void> deleteProduct({required String productId, required int index, required String imageUrl}) async {
    kShowLoading(Get.context!);
    try {
      await kFireStore.collection(kProductCollection).doc(productId).delete();
      Get.back();
      if (imageUrl.isNotEmpty) {
        try {
          await kStorageRef.refFromURL(imageUrl).delete();
        } catch (e) {
          kShowSnackBar(
            context: Get.context!,
            message: 'Error deleting image from Firebase Storage',
            isSuccess: false,
          );
        }
      }
      productList.removeWhere((element) => element.id == productId);
      kShowSnackBar(
        context: Get.context!,
        message: 'Product deleted successfully',
        isSuccess: true,
      );
    } catch (e) {
      Get.back();
      kShowSnackBar(
        context: Get.context!,
        message: 'Error deleting product',
        isSuccess: false,
      );
    }

    update();
  }
  Future getUserProducts() async {
    int? productLength;
    kFireStore
        .collection(kProductCollection)
        .where('userId', isEqualTo: kStorage.read(kUserId))
        .snapshots()
        .listen((snapshot) {
        productLength = snapshot.docs.length;
        _userProductsCount = RxInt(productLength!);
        update();
    });
    return productLength;
  }
  void addToCartItem({required String name, required String quantity, required String addUserID, required String productId, required String productUserId, required String productImage}) {
    var cartItem = CartItem(
        name: name,
        quantity: quantity,
        addUserId: addUserID,
        productId: productId,
        productUserId: productUserId,
        productImage: productImage);
    kFireStore
        .collection(kCartItemCollection)
        .add(cartItem.toMap())
        .then((docRef) {
      getMyCartProducts();
      kShowSnackBar(
          context: Get.context!,
          message: 'Your Item Successfully Add Into Cart',
          isSuccess: true);
    }).catchError((error) {
      kShowSnackBar(context: Get.context!, message: error, isSuccess: true);
    });
  }
  void getMyCartProducts() {
    myCartProductList.clear();
    isCartProductLoading(true);
    kFireStore
        .collection(kCartItemCollection)
        .where('user_id', isEqualTo: kStorage.read(kUserId) ?? '')
        .snapshots()
        .listen((snapshot) {
      myCartProducts.clear();
      for (var doc in snapshot.docs) {
        MyCartProduct product = MyCartProduct.fromSnapshot(doc);
        myCartProducts.add(product);
      }
      myCartProductList.assignAll(myCartProducts);
      isCartProductLoading(false);
      update();
    });
  }
   updateMyCartProductQuantity({required String id}){
    kFireStore.collection(kCartItemCollection).doc(id).update({
      'quantity': myCartQuantityController.text,
    }).then((value) {
      myCartQuantityController.clear();
      getMyCartProducts();
      Get.back();
      kShowSnackBar(
          context: Get.context!,
          message: 'Your Quantity Update',
          isSuccess: true);
      update();
    }).catchError((error) {
      kShowSnackBar(context: Get.context!, message: error, isSuccess: true);
    });
    update();
  }
  void removeFromCart({required String id}){
    kFireStore.collection(kCartItemCollection).doc(id).delete().then((value) {
      myCartProductList.removeWhere((element) => element.id == id);
      kShowSnackBar(
          context: Get.context!,
          message: 'Your Item Successfully Remove From Cart',
          isSuccess: true);
    }).catchError((error) {
      log('error_is_this $error');
      kShowSnackBar(context: Get.context!, message: error, isSuccess: true);
    });
    update();
  }
  @override
  void onInit() {
    super.onInit();
    getUserProducts();
    getMyCartProducts();
  }
}
