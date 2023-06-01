import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/user_controller.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerOrderScreen extends StatelessWidget {
  const SellerOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(title: const Text("Orders"),),
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: c.myOrdersList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = c.myOrdersList[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  elevation: 5.0,
                  shadowColor: Colors.teal.withOpacity(0.3),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.userName, style: kHeadingText.copyWith(fontSize: 14.0)),
                                Text(item.userEmail, style: kPrimaryText.copyWith(fontSize: 12.0, color: Colors.black)),
                                Text(item.address, style: kPrimaryText.copyWith(fontSize: 12.0, color: Colors.grey)),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  item.orderStatus == 1 ? 'Pending' : item.orderStatus == 2 ? "Confirm" : 'Pending',
                                  style: kSecondaryText.copyWith(
                                    color: item.orderStatus == 0 ? Colors.red : item.orderStatus == 1 ? Colors.red : Colors.green,
                                  ),
                                ),
                                item.orderStatus == 0 || item.orderStatus == 1?  GestureDetector(
                                  onTap: (){
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: 'Are you sure to confirm this order?',
                                      btnCancelOnPress: () {
                                        Get.back();
                                      },
                                      btnOkOnPress: () async{
                                        c.confirmOrder(id: item.id, status: 2);
                                      },
                                      btnCancelText: 'No',
                                      btnOkText: "Yes",
                                      btnOkColor: Colors.teal,
                                    ).show();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                                        child: Text(
                                          'Confirm',
                                          style: kSecondaryText.copyWith(
                                              color: Colors.white,fontSize: 10.0),
                                        ),
                                      )),
                                ):Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: item.products.map((product) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: kPrimaryColor,
                              backgroundImage: NetworkImage(product['product_image']),
                            ),
                            title: Row(
                              children: [
                                Text('Product Name:', style: kHeadingText.copyWith(fontSize: 13.0)),
                                10.0.width,
                                Text(product['productName'], style: kSecondaryText.copyWith(fontSize: 12.0)),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Quantity:', style: kHeadingText.copyWith(fontSize: 13.0,color: Colors.black)),
                                    10.0.width,
                                    Text(product['quantity'], style: kSecondaryText.copyWith(fontSize: 12.0)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Price:', style: kHeadingText.copyWith(fontSize: 13.0,color: Colors.black)),
                                    10.0.width,
                                    Text(product['totalPrice'].toString(), style: kSecondaryText.copyWith(fontSize: 12.0)),
                                  ],
                                ),
                              ],
                            ),
                            isThreeLine: true,
                          );
                        }).toList(),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Total Price:', style: kHeadingText.copyWith(fontSize: 13.0)),
                            10.0.width,
                            Text(item.allProductPrice.toString(), style: kSecondaryText.copyWith(fontSize: 12.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    );
  }
}
