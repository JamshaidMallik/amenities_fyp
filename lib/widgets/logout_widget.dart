import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';


GetBuilder<AuthController> logOutMethod(BuildContext context) {
  return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (c) {
        return IconButton(onPressed: (){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.rightSlide,
            title: 'Are you sure you want to logout',
            btnCancelOnPress: () {
              Get.back();
            },
            btnOkOnPress: () async{
              await c.logOut();
            },
            btnCancelColor: Colors.grey,
            btnCancelText: 'Cancel',
            btnOkText: "LogOut",
            btnOkColor: Colors.teal,
          ).show();
        }, icon: const Icon(Icons.logout));
      }
  );
}