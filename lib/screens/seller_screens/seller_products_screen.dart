import 'package:amenities_app/screens/seller_screens/seller_add_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://5.imimg.com/data5/SELLER/Default/2021/11/PN/KO/CP/142456981/single-water-wash-m-sand-250x250.jpg",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Text("Product Name", style: kHeadingText,),
                      Text("Supliar",style: kSubHeadingText,),
                    ],
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTealColor,
        onPressed: (){
        Get.to(()=> SellerAddProduct());
      },
      child: Icon(Icons.add),),
    );
  }
}
