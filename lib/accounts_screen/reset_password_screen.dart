import 'package:amenities_app/accounts_screen/update_password.dart';
import 'package:amenities_app/controller/auth_controller.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../widgets/button_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Your Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('Assets/Images/undraw_Mobile.png'),
              20.0.height,
              customTextField(hintText: 'email', controller: controller.emailController),
              50.0.height,
              primarybutton(btnText: 'Send',press: () async{
                await controller.forgetPassword();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
