import 'dart:developer';
import 'dart:io';

import 'package:amenities_app/screens/auth_screens/log_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant.dart';
import '../screens/admin_screen/admin_main_screen.dart';
import '../screens/seller_screens/seller_main_screen.dart';
import '../screens/user_screens/user_main_screen.dart';

class AuthController extends GetxController{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final Rx<String> selectedUserType = ''.obs;
  void updateSelectedStatus(String status) {
    selectedUserType.value = status;
  }

  /// image pick
  TextEditingController productNameController = TextEditingController();
  RxBool isProductLoading = false.obs;
  final ImagePicker _picker = ImagePicker();
  File? image;
  pickImage() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image = File(image.path);
      update();
    }
  }

  Future<String> uploadImageToStorage(File file) async {
    try {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref = kStorageRef.ref().child('$kProfileImage/$imageName.jpg');
      UploadTask uploadTask = ref.putFile(image!);
      TaskSnapshot storageSnapshot = await uploadTask;
      String imageUrl = await storageSnapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      rethrow;
    }
  }

  /// login method
  login() async {
    kShowLoading(Get.context!);
    try {
      update();
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);
      if (userCredential != null) {
        await FirebaseFirestore.instance.collection(kUserCollection).doc(userCredential!.user!.uid).get().then((value) {
          Get.back();
          emailController.clear();
          passwordController.clear();
          kStorage.write(kUserId, userCredential!.user!.uid);
          kStorage.write(kUserType, value['user_type']);
          if(value['user_type'] == 'Admin'){
            Get.offAll(()=> const AdminMainScreen());
          }else if(value['user_type'] == 'Seller'){
            Get.offAll(()=> const SellerMainScreen());
          }else if(value['user_type'] == 'User'){
            Get.offAll(()=> const UserMainScreen());
          }else{
            log('userTypeIs: ${value['user_type']}');
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      handleAuthException(e);
    } finally {
      update();
    }
  }
  /// signup method
  Future<void> signup() async {
    kShowLoading(Get.context!);
    try {
      userCredential = await auth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);
      Get.back();
      if (userCredential?.user != null) {
        String imageUrl = await uploadImageToStorage(image!); // Assign the result to imageUrl
        _firestore.collection(kUserCollection).doc(userCredential?.user!.uid).set({
          'user_id': userCredential?.user!.uid,
          'fullName': fullNameController.text,
          'email': userCredential?.user!.email,
          'user_type': selectedUserType.value,
          'created_at': DateTime.now(),
          'user_image': imageUrl,
          'user_phone': phoneController.text,
        }).then((value) {
          kShowSnackBar(context: Get.context!, message: 'Account Create Successfully', isSuccess: true);
          Get.offAll(()=> LogInScreen());
          image = null;
          fullNameController.clear();
          emailController.clear();
          passwordController.clear();
          selectedUserType.value = '';
          phoneController.clear();
          update();
        });
      }
    } on FirebaseAuthException catch(e) {
      Get.back();
      kShowSnackBar(context: Get.context!, message: e.toString(), isSuccess: false);
    }
    update();
  }

  /// forgot password method
  forgetPassword() async {
    try {
      update();
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      kShowSnackBar(context: Get.context!, message: 'Password reset link sent to your email', isSuccess: true);
      emailController.clear();
    } on FirebaseAuthException catch (e) {
      handleAuthException(e);
    } finally {
      update();
    }
  }
  /// logout method
  Future logOut() async {
    kShowLoading(Get.context!);
    await auth.signOut();
    Get.offAll(()=> LogInScreen());
  }
}


void handleAuthException(FirebaseAuthException exception) {
  String errorMessage = 'An error occurred during authentication.';
  switch (exception.code) {
    case 'invalid-email':
      errorMessage = 'Invalid email address.';
      break;
    case 'user-not-found':
      errorMessage = 'User not found.';
      break;
    case 'wrong-password':
      errorMessage = 'Incorrect password.';
      break;
    case 'email-already-in-use':
      errorMessage = 'Email address is already in use.';
      break;
    case 'user-disabled':
      errorMessage = 'This account has been disabled.';
      break;
    case 'user-token-expired':
      errorMessage = 'User token has expired. Please sign in again.';
      break;
    case 'too-many-requests':
      errorMessage = 'Too many sign-in attempts. Please try again later.';
      break;
    case 'network-request-failed':
      errorMessage = 'Network error. Please check your internet connection.';
      break;
    case 'requires-recent-login':
      errorMessage = 'Action requires recent authentication. Please sign in again.';
      break;
    case 'user-already-signed-in':
      errorMessage = 'User is already signed in.';
      break;
    default:
      errorMessage = 'Authentication failed. Please try again later.';
      break;
  }

  kShowSnackBar(
    context: Get.context!,
    message: errorMessage,
    isSuccess: false,
  );
}