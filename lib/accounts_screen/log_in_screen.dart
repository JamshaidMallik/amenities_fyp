import 'package:amenities_app/accounts_screen/reset_password_screen.dart';
import 'package:amenities_app/accounts_screen/sign_up_screen.dart';
import 'package:amenities_app/building_type_screen.dart';
import 'package:amenities_app/interest_area_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 80, ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign in", style: kBigHeadingText),
              Text('Welcome back!', style: kBigHeadingText.copyWith(fontSize: 14.0,fontWeight: FontWeight.w300),),
              20.0.height,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                ),
              ),
              20.0.height,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(
                      Icons.visibility_off_sharp,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, top: 10),
                child: GestureDetector(
                 onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(
                       builder: (context) =>
                           const ResetPasswordScreen()));
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
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InterestAreaScreen()));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.teal),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                                builder: (context) => const SignUpScreen()));
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
