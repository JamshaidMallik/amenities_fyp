import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/// App Colors
const Color kPrimaryColor = Color(0xff441A05);
const Color kBlackColor = Colors.black;
const Color kScaffoldBgColor = Colors.grey;
const Color kGreenColor = Colors.green;
const Color kBlueColor = Colors.blue;
const Color kYellowColor = Colors.yellow;
 Color kRedColor = Colors.red.shade400;
const Color ktealColor = Colors.teal;
const Color kOrangeColor = Colors.orange;
const Color kGreyColor = Colors.grey;
const Color kWhiteColor = Colors.white;


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
void kShowSnackBar(
    {required BuildContext context,
      required String message,
      required bool isSuccess}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: isSuccess ? kGreenColor : kRedColor,
    content: Text(message),
    duration: const Duration(seconds: 2),
  ));
}
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
      color: Colors.teal,
      fontWeight: FontWeight.w300,
    ));

TextStyle kSubHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w900,
    ));
TextStyle kHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ));
TextStyle kBigHeadingText = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 22.0,
      color: Colors.white,
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
// Define a list of colors
