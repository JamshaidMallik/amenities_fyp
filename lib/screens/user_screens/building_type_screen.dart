import 'package:amenities_app/screens/user_screens/commercial_area_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'residetial_area_screen.dart';

class BuildingTypeScreen extends StatelessWidget {
  const BuildingTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Choose your Building'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => const ResidentialAreaScreen()),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 10,
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(imageUrl: 'https://img.freepik.com/free-vector/beach-house-concept-illustration_114360-9433.jpg?w=1380&t=st=1684998205~exp=1684998805~hmac=dd0c03b93463d267a572d2d5855b030439edcc629b55ca9e0e7b9e1fe8893108',height: 150),
                          10.0.height,
                          Text("Residential", style: kSecondaryText),
                        ],
                      ),
                    )),
              ),
              20.0.height,
              GestureDetector(
                onTap: () => Get.to(() => const CommercialAreaScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(imageUrl: 'https://img.freepik.com/free-vector/urban-landscape-with-houses-buildings_1308-126447.jpg?w=1480&t=st=1684998069~exp=1684998669~hmac=b4b004e0f578e9c99fc6bac0bf016b850d983bb205f68579b154e4fff11c5eba',height: 150),
                        10.0.height,
                        Text("Commercial", style: kSecondaryText),
                      ],
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


//AreaScreen()