import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/profile_controller.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/button_widgets.dart';

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
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 170.0,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Stack(fit: StackFit.loose, children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundColor: Colors.grey.shade100,
                                          backgroundImage: NetworkImage(controller.userImage),

                                        ),
                                        // CircleAvatar(
                                        //   radius: 60,
                                        //   backgroundColor: Colors.grey.shade100,
                                        //   child: const Icon(
                                        //     Icons.person_rounded,
                                        //     size: 50,
                                        //     color: Colors.teal,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 80.0, left: 90.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {},
                                              child: const CircleAvatar(
                                                backgroundColor: kPrimaryColor,
                                                radius: 12.0,
                                                child: Icon(
                                                  Icons.photo_camera_back,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                  ]),
                                )
                              ],
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
                                    nameWidget(name: controller.nameController.text),
                                    10.0.height,
                                    nameWidget(name: controller.emailController.text),
                                    10.0.height,
                                    nameWidget(name: controller.phoneController.text),
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
                                ),
                          30.0.height,
                          controller.isView == true
                              ? primarybutton(btnText: 'Update',press: (){}): Container()

                        ],
                      ),
                    ),
                  ),
          );
        });
  }

  Widget nameWidget({required name}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name)),
      ),
    );
  }
}
