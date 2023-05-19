import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/auth_controller.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
        child: Column(

          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 50,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/236x/a1/e3/54/a1e354e74959e999b5fcbb95d1815bbd.jpg"),
              ),
            ),
            20.0.height,
           customTextField(hintText: "Name",controller: controller.fullNameController),
            10.0.height,
            customTextField(controller:controller.emailController,hintText: "Email"),
            10.0.height,
            customTextField(hintText: "Phone no",controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
