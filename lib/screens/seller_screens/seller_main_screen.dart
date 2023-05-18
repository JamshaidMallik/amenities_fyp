import 'package:amenities_app/constant.dart';
import 'package:amenities_app/screens/admin_screen/profile_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_order_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=>SellerProductsScreen());
                  },
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
            ),
            10.0.height,
            Card(
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=>SellerOrderScreen());
                  },
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
            ),
            10.0.height,
            Card(
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=>ProfileScreen());
                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
