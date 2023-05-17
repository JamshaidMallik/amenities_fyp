import 'package:amenities_app/accounts_screen/reset_password_screen.dart';
import 'package:amenities_app/accounts_screen/sign_up_screen.dart';
import 'package:amenities_app/controller/auth_controller.dart';
import 'package:amenities_app/interest_area_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../widgets/button_widgets.dart';
import '../widgets/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController()); // Get the instance of the auth controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 80, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign in", style: kBigHeadingText),
              Text('Welcome back!', style: kBigHeadingText.copyWith(fontSize: 14.0,fontWeight: FontWeight.w300),),
              20.0.height,
              customTextField(controller: controller.emailController, hintText: 'Email'),
              20.0.height,
              customTextField(hintText: 'Password', controller: controller.passwordController, suffixIcon: const Icon(Icons.visibility_off_sharp,)),
              30.0.height,
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                         ResetPasswordScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Recovery Password',)
                    ],
                  ),
                ),
              ),
              30.0.height,
              primarybutton(btnText: 'SignIn',press: () async{
                await controller.login();
              }),
              20.0.height,
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'Don’t have account?',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: ' Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                          },
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            // decoration: TextDecoration.underline,
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
