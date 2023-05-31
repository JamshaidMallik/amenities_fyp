 import 'dart:io';

import 'package:amenities_app/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_model.dart';

class ProfileController extends GetxController{
  RxBool isProfileLoading = false.obs;
  final RxBool _isView = false.obs;
  bool get isView => _isView.value;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String userImage = '';
  String userName = '';
  String userPhone = '';
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
        userImage = userProfile.userImage!;
        nameController.text = userProfile.fullName!;
        emailController.text = userProfile.email!;
        phoneController.text = userProfile.userPhone!;
        userName = userProfile.fullName!;
        userPhone = userProfile.userPhone!;
      }
      isProfileLoading(false);
      update();
    },onError: (error){
      kShowSnackBar(context: Get.context!, message: 'Something Wrong', isSuccess: false);
      isProfileLoading(false);
      update();
    });
  }
  void updateProfile() async {
    try {
      isProfileLoading(true);
      String fullName = nameController.text.trim();
      String phone = phoneController.text.trim();
      await kFireStore.collection(kUserCollection).doc(kStorage.read(kUserId) ?? '').update({
        'fullName': fullName,
        'user_phone': phone,
      });
      // Update the local variables with the updated values
      UserModel userProfile = UserModel(
        fullName:  fullName,
        userPhone: phone,
        createdAt: DateTime.now(),
      );

      // Update the UI
      nameController.text = userProfile.fullName!;
      phoneController.text = userProfile.userPhone!;
      kShowSnackBar(
        context: Get.context!,
        message: 'Profile updated successfully',
        isSuccess: true,
      );
    } catch (error) {
      kShowSnackBar(
        context: Get.context!,
        message: 'Failed to update profile. Please try again.',
        isSuccess: false,
      );
    } finally {
      isProfileLoading(false);
      update();
    }
  }
  uploadProfileImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      File image = File(pickedFile!.path);
      kShowLoading(Get.context!);
      update();
      await kStorageRef.refFromURL(userImage).delete();
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = kStorageRef.ref().child('$kProfileImage/$imageName.jpg');
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot storageSnapshot = await uploadTask;
      String imageUrl = await storageSnapshot.ref.getDownloadURL();
      await kFireStore.collection(kUserCollection).doc(kStorage.read(kUserId) ?? '').update({
        'user_image': imageUrl,
      });
      Get.back();
      await getUserProfile(userId: kStorage.read(kUserId) ?? '');
    } on FirebaseException catch (e) {
      Get.back();
      kShowSnackBar(context: Get.context!, message: e.code.toString(), isSuccess: false);
    }
    update();
  }



}