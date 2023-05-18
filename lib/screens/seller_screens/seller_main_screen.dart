import 'package:amenities_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SellerMainScreen extends StatelessWidget {
  const SellerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Card(
              child: Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.teal.shade300,
                  ),
                  child: Center(
                    child: Text("Products",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                ),
              ),
            ),
            10.0.height,
            Card(
              child: Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.teal.shade300,
                  ),
                  child: Center(
                    child: Text("Orders",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
            ),
            10.0.height,
            Card(
              child: Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.teal.shade300,
                  ),
                  child: Center(
                    child: Text("Go to Profile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
