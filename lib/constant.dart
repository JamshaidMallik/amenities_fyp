import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/progress_dialog.dart';
/// App Colors
const Color kPrimaryColor = Colors.teal;
const Color kBlackColor = Colors.black;
const Color kScaffoldBgColor = Colors.grey;
const Color kGreenColor = Colors.green;
const Color kBlueColor = Colors.blue;
const Color kYellowColor = Colors.yellow;
final Color kRedColor = Colors.red.shade400;
const Color kTealColor = Colors.teal;
const Color kOrangeColor = Colors.orange;
const Color kGreyColor = Colors.grey;
const Color kWhiteColor = Colors.white;

/// local storage
final GetStorage kStorage = GetStorage();
// local storage keys
String kUserType = 'user_type';
String kUserId = 'User_id';

/// collection of Firebase
String kUserCollection = 'users';
String kProductCollection = 'products';
String kCartItemCollection = 'cart_item';
String kCheckOutCollection = 'check_out';
String kProfileImage = 'ProfileImage';
FirebaseFirestore kFireStore = FirebaseFirestore.instance;
FirebaseStorage kStorageRef = FirebaseStorage.instance;

/// App Padding and margin
double kDefaultPadding = 12.0;
double kDefaultMargin = 16.0;

/// Media Query Size
var kSize = MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

/// App sizes
extension SpaceXY on double {
  SizedBox get width => SizedBox(width: this);
  SizedBox get height => SizedBox(height: this);
}

/// App SnackBar
void kShowSnackBar({required BuildContext context, required String message, required bool isSuccess}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: isSuccess ? kGreenColor : kRedColor,
    content: Text(message),
    duration: const Duration(seconds: 2),
  ));
}

/// place holder images
var placeHolderPic = 'Assets/Images/placeholder.jpg';

/* App Text Styles */
/// black Text Styles
TextStyle kPrimaryText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w300,
    ));
TextStyle kSecondaryText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w300,
    ));
TextStyle kSubHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ));
TextStyle kHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ));
TextStyle kBigHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    ));

/// white Text Styles
TextStyle kPrimaryWhiteText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ));
TextStyle kSecondaryWhiteText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ));
TextStyle kSubHeadingWhiteText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ));
TextStyle kHeadingWhiteText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ));
TextStyle kBigHeadinWhiteText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ));

/// gray Text Styles
TextStyle kPrimaryGrayText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: kGreyColor,
      fontSize: 12.0,
      fontWeight: FontWeight.w300,
    ));


void kShowLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => ProgressDialog(),
  );
}