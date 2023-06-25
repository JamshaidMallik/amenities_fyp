import 'package:amenities_app/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../widgets/photo_view.dart';
import '../seller_screens/seller_products_screen.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
        init: AdminController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(title: const Text("Users"),),
            body: ListView.builder(
                itemCount: c.users.length,
                itemBuilder: (context, index) {
                  var users = c.users[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 8.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> PhotoViewPage(users.userImage.toString()));
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: kPrimaryColor,
                                    maxRadius: 30,
                                    backgroundImage: NetworkImage(users.userImage.toString()),
                                  ),
                                ),
                                10.0.width,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(users.fullName.toString(),style: kHeadingText,),
                                        Text(users.email.toString(),style: kSubHeadingText),
                                        Text(users.userPhone.toString(),style: kSecondaryText,),
                                        Row(
                                          children: [
                                            Text("Type: ",style: kSecondaryText,),
                                            Text(users.userType.toString(),style: kSecondaryText.copyWith(color: Colors.green),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            10.0.height,
                            if(users.userType == 'Seller')
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                    color: kPrimaryColor,
                                    minWidth: double.infinity,
                                    onPressed: (){
                                      Get.to(()=> SellerProductsScreen(users.userId.toString()));
                                    }, child: const Text("Products",style: TextStyle(color: Colors.white),)),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
    );
  }
}
