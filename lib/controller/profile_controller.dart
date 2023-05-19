import 'dart:developer';
import 'package:amenities_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/user_model.dart';

class ProfileController extends GetxController{
  RxBool isProfileLoading = false.obs;
  final RxBool _isView = false.obs;
  bool get isView => _isView.value;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String userImage = '';
  void profileUpdateToggle(){
    _isView.toggle();
    update();
  }
  getUserProfile({required String userId}) async {
   isProfileLoading(true);
    update();
    kFireStore.collection(kUserCollection).doc(userId).get().then((value) {
      if (value.exists) {
        UserModel userProfile = UserModel.fromJson(value.data() as Map<String, dynamic>);
        userImage = userProfile.userImage;
        nameController.text = userProfile.fullName;
        emailController.text = userProfile.email;
        phoneController.text = userProfile.userPhone;
      }
      isProfileLoading(false);
      update();
    },onError: (error){
      kShowSnackBar(context: Get.context!, message: 'Something Wrong', isSuccess: false);
      isProfileLoading(false);
      update();
    });
  }



}