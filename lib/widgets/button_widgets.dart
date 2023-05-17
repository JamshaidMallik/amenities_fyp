import 'package:flutter/material.dart';

Widget primarybutton({required String btnText, Function()? press }) {
  return GestureDetector(
    onTap: press ?? () {},
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.teal),
      child:  Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}