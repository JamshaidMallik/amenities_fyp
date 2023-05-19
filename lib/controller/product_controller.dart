import 'dart:io';
import 'package:amenities_app/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController{
  User? userId = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  TextEditingController productNameController = TextEditingController();
  File? image;
  pickImage()async{
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      this.image = File(image.path);
      update();
    }
  }



  addProduct(){
    kFireStore.collection('products').doc().set({
      "createdAt": DateTime.now(),
      "product_name":'product1',
      "userId": userId?.uid,
      "image":"",
      "status":"",
    }).then((value){
      kShowSnackBar(context: Get.context!, message: 'Product Add', isSuccess: true);
    });
  }

}