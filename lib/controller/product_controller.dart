import 'dart:io';
import 'package:amenities_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  TextEditingController productNameController = TextEditingController();
  File? image;
  pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      update();
    }
  }

  addProduct() async {
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
        update();
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
  getProducts(){

  }
}
