import 'package:flutter/material.dart';

import '../constant.dart';
Widget customTextField({TextEditingController? controller ,required String hintText, Icon? suffixIcon, bool? readOnly, Function(String)? onSubmitted}) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20)),
    child: TextField(
      cursorColor: kPrimaryColor,
      onSubmitted: onSubmitted,
      readOnly: readOnly ?? false,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintStyle: kPrimaryGrayText.copyWith(
          fontSize: 14.0
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(25),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          hintText: hintText, border: InputBorder.none),
    ),
  );
}