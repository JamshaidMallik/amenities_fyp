import 'package:amenities_app/constant.dart';
import 'package:amenities_app/screens/admin_screen/profile_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_order_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_products_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class SellerMainScreen extends StatelessWidget {
  const SellerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Home"),
        actions: [
          GetBuilder<AuthController>(
            init: AuthController(),
            builder: (c) {
              return IconButton(onPressed: (){
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Are you sure you want to logout',
                  btnCancelOnPress: () {
                    Get.back();
                  },
                  btnOkOnPress: () async{
                  await c.logOut();
                  },
                  btnCancelText: 'Cancel',
                  btnOkText: "LogOut",
                  btnOkColor: Colors.teal,
                ).show();
              }, icon: const Icon(Icons.logout));
            }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       Get.to(()=>const SellerProductsScreen());
                     },
                     child: Container(
                       height: 200,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.teal.shade300,
                       ),
                       child: const Center(
                         child: Text("Products",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                       ),
                     ),
                   ),
                 ),
                 10.0.width,
                 Expanded(
                   child: GestureDetector(
                     onTap: (){
                       Get.to(()=>const SellerOrderScreen());
                     },
                     child: Container(
                       height: 200,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.teal.shade300,
                       ),
                       child: const Center(
                         child: Text("Orders",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(()=>ProfileScreen());
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal.shade300,
                  ),
                  child: const Center(
                    child: Text("Go to Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
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
