import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 80, ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up", style: kBigHeadingText),
              const Text('Enter your email and password'),
              const Text('and start creating'),
              20.0.height,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        border: InputBorder.none
                    ),
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
                child: const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              20.0.height,
              Container(height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon:
                    Icon(Icons.visibility_off_sharp, ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              30.0.height,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
