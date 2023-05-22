import 'package:amenities_app/screens/user_screens/all_seller_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant.dart';
import 'building_type_screen.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your Building Type'),
        leading: const Icon(
          Icons.menu,
          color: kWhiteColor,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const AllSellerScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Icon(
                      Icons.production_quantity_limits_sharp,
                      size: 50,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              20.0.height,
              GestureDetector(
                onTap: () => Get.to(() => const BuildingTypeScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Icon(
                      Icons.add_box_rounded,
                      size: 50,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
