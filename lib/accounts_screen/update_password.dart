import 'package:amenities_app/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Reset Password"),
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
                  prefixIcon: Icon(Icons.lock_outline,color: kTealColor,),
                    hintText: "New Password", border: InputBorder.none),
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
                prefixIcon: Icon(Icons.lock_outline,color: kTealColor,),
                hintText: "Confirm Password",
                suffixIcon:
                Icon(Icons.visibility_off_sharp,color: kTealColor, ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
              ),
            ),
          ),
          50.0.height,
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              onTap: (){
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                  title: 'Successful Password Reset',
                    // btnCancelOnPress: () {},
                btnOkOnPress: () {},
                  btnOkText: "Login",
                  btnOkColor: kTealColor,
                )..show();
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
                      "Done",
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
