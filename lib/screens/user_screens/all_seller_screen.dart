import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constant.dart';
import '../seller_screens/seller_products_screen.dart';

class AllSellerScreen extends StatelessWidget {
  const AllSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Detail"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: NetworkImage("https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg"),
                          // height: 50,
                          // width: 60,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Briks,No1",style: kHeadingText,),
                              Text("Applicable",style: kSubHeadingText.copyWith(color: kGreenColor)),
                              Text("Supliar",style: kSecondaryText.copyWith(color: kRedColor),),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.teal,),
                            onPressed: (){
                            Get.to(()=>SellerProductsScreen());
                            }, child: Text("View"))
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
