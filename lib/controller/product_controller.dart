import 'dart:developer';
import 'dart:io';
import 'package:amenities_app/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  RxList<Product> productList = RxList<Product>();
  List<Product> products = [];

  final ImagePicker _picker = ImagePicker();
  TextEditingController productNameController = TextEditingController();
  RxBool isProductLoading = false.obs;
  File? image;

  pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      update();
    }
  }
  addProduct({required String userId}) async {
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
  getProducts({required String userId}) {
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


  @override
  void onInit() {
    super.onInit();
    getProducts(userId: kStorage.read(kUserId));
  }

}
