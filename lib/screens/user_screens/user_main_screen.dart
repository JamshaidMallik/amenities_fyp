import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/controller/user_controller.dart';
import 'package:amenities_app/screens/user_screens/all_seller_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../profile_screen.dart';
import 'user_order_Screen.dart';
import 'building_type_screen.dart';
import 'cart_screen.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amenities'),
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(() => const CartScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Center(
                child: GetBuilder<ProductController>(
                    init: ProductController(),
                    builder: (controller) {
                      return controller.myCartProductList.isNotEmpty
                          ? Badge(
                              backgroundColor: Colors.red,
                              label: Text(controller.myCartProductList.length.toString()),
                              child: const Icon(Icons.shopping_cart))
                          : const Icon(Icons.shopping_cart);
                    }),
              ),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              20.0.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Amenities", style: kHeadingText),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title:  Text("Home", style: kSecondaryText),
                onTap: () => Get.back(),
              ),
              ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title:  Text("Profile",style: kSecondaryText),
                onTap: () {
                  Get.to(() => ProfileScreen());
                },
              ),
              ListTile(
                  leading: const Icon(Icons.emoji_people_sharp),
                  title: Text("My Orders", style: kSecondaryText),
                  onTap: () {
                      Get.to(() => const UserOrders());
                  }),
              const Divider(),
              GetBuilder<AuthController>(
                init: AuthController(),
                builder: (c) {
                  return ListTile(
                      leading: const Icon(Icons.logout,color: Colors.red,),
                      title:  Text("logout", style: kSecondaryText.copyWith(color: Colors.red)),
                      onTap: () {
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
                      });
                }
              ),
            ],
          ),
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
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.freepik.com/free-vector/two-storey-house-with-red-roof_1308-34753.jpg?size=626&ext=jpg&ga=GA1.1.2048458770.1673854843&semt=sph",
                            height: 100,
                          ),
                          10.0.height,
                          Text("Buy Products", style: kSecondaryText),
                        ],
                      ),
                    )),
              ),
              20.0.height,
              GestureDetector(
                onTap: () => Get.to(() => const BuildingTypeScreen()),
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
                        Image.network(
                          'https://img.freepik.com/free-vector/concept-house-searching-landing-page_52683-25530.jpg?size=626&ext=jpg&ga=GA1.1.2048458770.1673854843&semt=ais',
                          height: 100,
                        ),
                        10.0.height,
                        Text("Estimate", style: kSecondaryText),
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
