
import 'package:amenities_app/profile_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import 'order_screen.dart';


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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('flutter.com'),
              accountEmail: Text("example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/236x/a1/e3/54/a1e354e74959e999b5fcbb95d1815bbd.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Amenities", style: kSubHeadingText),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text("Profile"),
              onTap: () {
               Get.to(()=>ProfileScreen());
              },
            ),
            ListTile(
                leading: const Icon(Icons.emoji_people_sharp),
                title: const Text("Orders"),
                onTap: () {
                  Get.to(()=>const OrderScreen());
                }),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Setting"),
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Help & Sport"),
              onTap: () => null,
            ),
            ListTile(
              leading: const Icon(Icons.data_usage_sharp),
              title: const Text("About us"),
              onTap: () => null,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Get Estimation",
                  style: kSecondaryText,
                )),
              ),
            ),
          ],
        ),
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
                              "Orders",
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
                // 10.0.width,
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
                              color: Colors.teal.shade300,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                "Complain",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
