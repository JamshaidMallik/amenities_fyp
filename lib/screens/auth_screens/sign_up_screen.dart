import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/custom_text_field.dart';
import 'log_in_screen.dart';

class SignUpScreen extends GetView<AuthController> {
  @override
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
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (c) {
                    return SizedBox(
                      height: 170.0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Stack(fit: StackFit.loose, children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  c.image == null
                                      ? CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.grey.shade100,
                                          child: const Icon(
                                            Icons.person_rounded,
                                            size: 50,
                                            color: Colors.teal,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.grey.shade100,
                                          backgroundImage: FileImage(c.image!),
                                        ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 80.0, left: 90.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => c.pickImage(),
                                        child: const CircleAvatar(
                                          backgroundColor: kPrimaryColor,
                                          radius: 12.0,
                                          child: Icon(
                                            Icons.photo_camera_back,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ]),
                          )
                        ],
                      ),
                    );
                  }),
              10.0.height,
              Obx(() => ToggleButtons(
                    fillColor: kPrimaryColor,
                    color: Colors.black,
                    textStyle: kPrimaryText.copyWith(fontSize: 14.0, fontWeight: FontWeight.w300, color: Colors.black),
                    selectedColor: Colors.white,
                    tapTargetSize: MaterialTapTargetSize.padded,
                    isSelected: [
                      controller.selectedUserType.value == 'User',
                      controller.selectedUserType.value == 'Seller',
                    ],
                    onPressed: (int index) {
                      if (index == 0) {
                        controller.updateSelectedStatus('User');
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
                            'User',
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
              customTextField(
                hintText: 'Password',
                controller: controller.passwordController,
                suffixIcon: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.changeVisibility();
                    },
                    child: Icon(
                      controller.isVisible.value ? Icons.visibility : Icons.visibility_off_sharp,
                      color: Colors.teal,
                    ),
                  );
                }),
              ),
              30.0.height,
              primarybutton(
                  btnText: 'Sign Up',
                  press: () async {
                    if (controller.selectedUserType == '') {
                      kShowSnackBar(context: context, message: 'Please Select User Type', isSuccess: false);
                    }
                    // else if (controller.image == null) {
                    //   kShowSnackBar(context: context, message: 'Please select the image', isSuccess: false);
                    // }
                    else {
                      await controller.signup();
                    }
                  }),
              30.0.height,
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: 'already have an account?', style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: ' Sign in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => LogInScreen());
                          },
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: kPrimaryColor),
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
