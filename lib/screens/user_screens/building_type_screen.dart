import 'package:amenities_app/screens/user_screens/area_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant.dart';
import 'input_estimate_screen.dart';

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
                onTap: () => Get.to(() => const AreaScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Icon(
                      Icons.home_outlined,
                      size: 50,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              20.0.height,
              GestureDetector(
                onTap: () =>  Get.to(() => const InputEstimateScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child: const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Icon(
                      Icons.add_card,
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


//AreaScreen()