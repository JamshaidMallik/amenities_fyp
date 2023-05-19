import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/controller/profile_controller.dart';
import 'package:amenities_app/profile_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_order_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/logout_widget.dart';

class SellerMainScreen extends StatelessWidget {
  const SellerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back),
            title:  Text("Home"),
            actions: [
              logOutMethod(context),
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
                         child: Card(
                           elevation: 10.0,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child:  SizedBox(
                             height: 200,
                             child: Center(
                               child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Products",style: kPrimaryText.copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                   Text(controller.userProductCount.toString() ?? '0',style:kPrimaryText.copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                 ],
                               ),
                             ),
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
                         child: Card(
                           shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                           ),
                           elevation: 10.0,
                           child:  SizedBox(
                             height: 200,
                             child: Center(
                               child: Text("Orders",style: kPrimaryText.copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),),
                             ),
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
                      Get.to(()=> ProfileScreen());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10.0,
                      child:  SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Center(
                          child: Text("Go to Profile",style: kPrimaryText.copyWith(fontSize: 16.0,fontWeight: FontWeight.bold),),
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
    );
  }
}
