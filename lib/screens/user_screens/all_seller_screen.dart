import 'package:amenities_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../seller_screens/seller_products_screen.dart';

class AllSellerScreen extends StatelessWidget {
  const AllSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(title: const Text("User Detail"),),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: c.allSeller.length,
                itemBuilder: (context, index) {
                  var users = c.allSeller[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             CircleAvatar(
                              maxRadius: 30,
                              backgroundImage: NetworkImage(users.userImage),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(users.fullName,style: kHeadingText,),
                                  Text("Applicable",style: kSubHeadingText.copyWith(color: kGreenColor)),
                                  Text("Supliar",style: kSecondaryText.copyWith(color: kRedColor),),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.teal,),
                                onPressed: (){
                                Get.to(()=>const SellerProductsScreen());
                                }, child: const Text("View"))
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
        );
      }
    );
  }
}
