import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Sighn Up",
                  style: kBigHeadingText
              ),
              Text('Enter your email and password'),
              Text('and start creating'
              ),
              20.0.height,
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: const TextField(
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
                width: 300,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey),
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
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
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(15),
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
              Center(
                child: Text(
                  "Or,continue with",
                ),
              ),
              30.0.height,
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kRedColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("https://i.pinimg.com/564x/d1/d5/4f/d1d54f6b1b7922b8976b0b83e8a1f91b.jpg"),
                      ),
                      // Icon(Icons.baby_changing_station),
                      Text('continue with facebook',style:kSecondaryWhiteText),

                    ],
                  ),
                ),
              ),
              20.0.height,
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage("https://i.pinimg.com/564x/60/41/99/604199df880fb029291ddd7c382e828b.jpg"),
                      ),
                      // Icon(Icons.baby_changing_station),
                      Text('continue with Google',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
              20.0.height,
              Center(
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
