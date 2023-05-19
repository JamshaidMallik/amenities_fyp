import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/profile_controller.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends GetView<ProfileController> {
  final profile = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    profile.getUserProfile(userId: kStorage.read(kUserId));
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Profile"),
            ),
            body: controller.isProfileLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Center(
                            child: CircleAvatar(
                              maxRadius: 50,
                              backgroundImage: NetworkImage(
                                  "https://i.pinimg.com/236x/a1/e3/54/a1e354e74959e999b5fcbb95d1815bbd.jpg"),
                            ),
                          ),
                          20.0.height,
                          GestureDetector(
                            onTap: () => controller.profileUpdateToggle(),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      controller.isView == true
                                          ? "View"
                                          : "Update",
                                      style: kSecondaryText.copyWith(
                                          color: kPrimaryColor)),
                                  5.0.width,
                                  Icon(
                                      controller.isView == true
                                          ? Icons.remove_red_eye_rounded
                                          : Icons.edit,
                                      color: Colors.grey,
                                      size: 20.0),
                                ],
                              ),
                            ),
                          ),
                          20.0.height,
                          controller.isView == false
                              ? Column(
                                  children: [
                                    customTextField(
                                        hintText: "Name",
                                        controller: controller.nameController,
                                        readOnly: true),
                                    10.0.height,
                                    customTextField(
                                        controller: controller.emailController,
                                        hintText: "Email",
                                        readOnly: true),
                                    10.0.height,
                                    customTextField(
                                        hintText: "Phone Number",
                                        controller: controller.phoneController,
                                        readOnly: true),
                                  ],
                                )
                              : Column(
                                  children: [
                                    customTextField(
                                        hintText: "Name",
                                        controller: controller.nameController),
                                    10.0.height,
                                    customTextField(
                                        controller: controller.emailController,
                                        hintText: "Email",
                                        readOnly: true),
                                    10.0.height,
                                    customTextField(
                                        hintText: "Phone Number",
                                        controller: controller.phoneController),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
