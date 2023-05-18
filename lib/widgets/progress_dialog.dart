import 'package:amenities_app/constant.dart';
import 'package:flutter/material.dart';


class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation:  10,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
