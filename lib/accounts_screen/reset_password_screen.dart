import 'package:amenities_app/accounts_screen/update_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Forget yuor Password"),
      ),
      body: Column(
        children: [
        Image.asset('Assets/Images/undraw_Mobile.png'),
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
                  icon: Icon(Icons.account_box_outlined,color: kTealColor,),
                    hintText: "Email", border: InputBorder.none),
              ),
            ),
          ),
          50.0.height,
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UpdatePassword()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
