import 'package:flutter/material.dart';

import '../constant.dart';
Widget customTextField({TextEditingController? controller ,required String hintText, Icon? suffixIcon}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20)),
    child: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration:  InputDecoration(
            hintText: hintText, border: InputBorder.none),
      ),
    ),
  );
}