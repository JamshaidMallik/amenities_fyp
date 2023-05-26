import 'package:amenities_app/controller/user_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../seller_screens/seller_products_screen.dart';

class AllSellerScreen extends StatelessWidget {
  const AllSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(title: const Text("Sellers"),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: c.allSeller.length,
                itemBuilder: (context, index) {
                  var users = c.allSeller[index];
                  return Card(
                    shadowColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               CircleAvatar(
                                 backgroundColor: kPrimaryColor,
                                 maxRadius: 30,
                                 backgroundImage: CachedNetworkImageProvider(users.userImage.toString()),
                              ),
                              10.0.width,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(users.fullName.toString(),style: kHeadingText,),
                                      Text(users.email.toString(),style: kSubHeadingText),
                                      Text(users.userPhone.toString(),style: kSecondaryText,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minWidth: double.infinity,
                                color: kPrimaryColor,
                                onPressed: (){
                                  Get.to(()=> SellerProductsScreen(users.userId.toString()));
                                }, child: const Text("Products",style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      }
    );
  }
}
