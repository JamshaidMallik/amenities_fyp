
import 'package:amenities_app/profile_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../user_screens/user_order_Screen.dart';
import 'admin_orders_screen.dart';


class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          GetBuilder<AuthController>(
              init: AuthController(),
              builder: (c) {
                return IconButton(onPressed: (){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.rightSlide,
                    title: 'Are you sure you want to logout',
                    btnCancelOnPress: () {
                      Get.back();
                    },
                    btnOkOnPress: () async{
                      await c.logOut();
                    },
                    btnCancelText: 'Cancel',
                    btnOkText: "LogOut",
                    btnOkColor: Colors.teal,
                  ).show();
                }, icon: const Icon(Icons.logout));
              }
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.teal.shade300),
                            child: const Center(
                                child: Text(
                              "Users",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.teal.shade300),
                            child: const Center(
                                child: Text(
                              "Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>const AdminOrdersScreen());
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: Colors.teal.shade300),
                              child: const Center(
                                  child: Text(
                                "Orders",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>ProfileScreen());
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.teal.shade300,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
