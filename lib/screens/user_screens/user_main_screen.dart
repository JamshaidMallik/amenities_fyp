import 'package:amenities_app/screens/user_screens/all_seller_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../profile_screen.dart';
import '../admin_screen/order_screen.dart';
import 'building_type_screen.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GetBuilder<AuthController>(
              init: AuthController(),
              builder: (c) {
                return IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.rightSlide,
                        title: 'Are you sure you want to logout',
                        btnCancelOnPress: () {
                          Get.back();
                        },
                        btnOkOnPress: () async {
                          await c.logOut();
                        },
                        btnCancelText: 'Cancel',
                        btnOkText: "LogOut",
                        btnOkColor: Colors.teal,
                      ).show();
                    },
                    icon: const Icon(Icons.logout));
              }),
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
                Get.to(() => ProfileScreen());
              },
            ),
            ListTile(
                leading: const Icon(Icons.emoji_people_sharp),
                title: const Text("Orders"),
                onTap: () {
                  Get.to(()=>const OrderScreen());
                }),
          ],
        ),
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
                  child:SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("https://img.freepik.com/free-vector/two-storey-house-with-red-roof_1308-34753.jpg?size=626&ext=jpg&ga=GA1.1.2048458770.1673854843&semt=sph",height: 100,),
                        Text("Get Product")
                      ],
                    ),
                  )

                ),
              ),
              20.0.height,
              GestureDetector(
                onTap: () => Get.to(() => const BuildingTypeScreen()),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 10,
                  child:  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network('https://img.freepik.com/free-vector/concept-house-searching-landing-page_52683-25530.jpg?size=626&ext=jpg&ga=GA1.1.2048458770.1673854843&semt=ais',height: 100,),
                        Text("Estimate"),
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
