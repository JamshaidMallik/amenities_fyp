import 'package:amenities_app/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../seller_screens/seller_products_screen.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
        init: AdminController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(title: const Text("Sellers"),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: c.users.length,
                  itemBuilder: (context, index) {
                    var users = c.users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: kPrimaryColor,
                                maxRadius: 30,
                                backgroundImage: NetworkImage(users.userImage.toString()),
                              ),
                              10.0.width,
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 80),
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Colors.teal,),
                                  onPressed: (){
                                    Get.to(()=> SellerProductsScreen(users.userId.toString()));
                                  }, child: const Text("View")),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        }
    );
  }
}
