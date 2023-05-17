import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';

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

  login() async {
    try {
      update();
      userCredential = await auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);
      if (userCredential != null) {
        await FirebaseFirestore.instance.collection(kUserCollection).doc(userCredential!.user!.uid).get().then((value) {
          kShowSnackBar(context: Get.context!, message: 'user login', isSuccess: true);
          log("user_type: ${value['user_type']}");
          if(value['user_type'] == 'Admin'){
            log('userTypeIs: ${value['user_type']}');
          }else if(value['user_type'] == 'Buyer'){
            log('userTypeIs: ${value['user_type']}');
          }else if(value['user_type'] == 'Seller'){
            log('userTypeIs: ${value['user_type']}');
          }else{
            log('userTypeIs: ${value['user_type']}');
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      handleAuthException(e);
    } finally {
      update();
    }
  }

  Future<void> signup() async{
    try{
      userCredential = await auth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text).then((value){
        log('User_Created_Successfully ${value.user!.uid} : ${value.user!.email}');
        if (value.user != null){
          _firestore.collection(kUserCollection).doc(value.user!.uid).set({
            'user_id': value.user!.uid,
            'fullName': fullNameController.text,
            'email': value.user!.email,
            'user_type': selectedUserType.value,
            'created_at': DateTime.now(),
            'user_image': '',
            'user_phone': phoneController.text,
          }).
          then((value){
            kShowSnackBar(context: Get.context!, message: 'Account Create Successfully', isSuccess: true);
            fullNameController.clear();
            emailController.clear();
            passwordController.clear();
            selectedUserType.value = '';
            phoneController.clear();
          });
        }
      });
    } on FirebaseAuthException catch(e){
      kShowSnackBar(context: Get.context!, message: e.toString(), isSuccess: false);
    }
    update();
  }
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
    await auth.signOut();
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