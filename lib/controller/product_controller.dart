import 'dart:io';
import 'package:amenities_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductController extends GetxController{
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

}