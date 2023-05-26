import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';
import '../controller/auth_controller.dart';
Widget customTextField({TextEditingController? controller, required String hintText, Widget? suffixIcon, bool? readOnly, Function(String)? onSubmitted, TextInputType? keyboardType,}) {
  return GetBuilder(
    init: AuthController(),
    builder: (ccc) {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          keyboardType:keyboardType ?? TextInputType.text,
          cursorColor: kPrimaryColor,
          obscureText: hintText == 'Password'? ccc.isVisible.value:  false,
          onSubmitted: onSubmitted,
          readOnly: readOnly ?? false,
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
          suffixIcon: suffixIcon,
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
  );
}