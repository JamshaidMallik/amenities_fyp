import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/custom_text_field.dart';


class SignUpScreen extends GetView<AuthController> {
  final AuthController controller = Get.find<AuthController>(); // Get the instance of the auth controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 80,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up", style: kBigHeadingText),
              10.0.height,
              const Text('Enter your email and password'),
              const Text('And Choose your type'),
              20.0.height,
              Obx(() => ToggleButtons(
                    fillColor: kPrimaryColor,
                    color: Colors.black,
                    textStyle: kPrimaryText.copyWith(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    selectedColor: Colors.white,
                    tapTargetSize: MaterialTapTargetSize.padded,
                    isSelected: [
                      controller.selectedUserType.value == 'Buyer',
                      controller.selectedUserType.value == 'Seller',
                    ],
                    onPressed: (int index) {
                      if (index == 0) {
                        controller.updateSelectedStatus('Buyer');
                      } else if (index == 1) {
                        controller.updateSelectedStatus('Seller');
                      }
                    },
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Buyer',
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Seller',
                          ),
                        ),
                      ),
                    ],
                  )),
              20.0.height,
              customTextField(controller: controller.fullNameController, hintText: 'Full Name'),
              20.0.height,
              customTextField(controller: controller.phoneController, hintText: 'Phone Number'),
              20.0.height,
              customTextField(controller: controller.emailController, hintText: 'Email'),
              20.0.height,
              customTextField(hintText: 'Password', controller: controller.passwordController, suffixIcon: const Icon(Icons.visibility_off_sharp,)),
              30.0.height,
              primarybutton(btnText: 'Sign Up',press: () async{
               await controller.signup();
              }),
              20.0.height,
              const Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'already have an account?',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: ' Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: kBlueColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
