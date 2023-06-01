import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/user_controller.dart';
import 'package:amenities_app/model/my_cart_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button_widgets.dart';
import '../../widgets/custom_text_field.dart';

class CheckOutScreen extends StatelessWidget {
  final List<MyCartProduct> myCartProductList;
  final double totalPrice;
  const CheckOutScreen(this.myCartProductList, this.totalPrice, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (c) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Check Out'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      elevation: 15.0,
                      shadowColor: Colors.teal.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Fill In the Blanks',style: kHeadingText.copyWith(color: Colors.black,fontSize: 14.0),),
                          ),
                            10.0.height,
                          customTextField( hintText: 'Full Name',controller: c.nameController),
                          20.0.height,
                          customTextField( hintText: 'Email', controller: c.emailController),
                          20.0.height,
                          customTextField( hintText: 'Phone No', controller: c.contactNoController),
                          20.0.height,
                          customTextField( hintText: 'Complete Address', controller: c.addressController),
                        ],),
                      ),
                    ),
                    10.0.height,
                    if(myCartProductList.isNotEmpty)
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      elevation: 15.0,
                      shadowColor: Colors.teal.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Product Name', style: kHeadingText.copyWith(color: Colors.black,fontSize: 14.0),),
                                  Text('Quantity', style: kHeadingText.copyWith(color: Colors.black,fontSize: 14.0),),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: myCartProductList.map((element) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(element.name, style: kSecondaryText,),
                                        Text(element.quantity.toString(), style: kPrimaryText,),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              )).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    15.0.height,
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      elevation: 15.0,
                      shadowColor: Colors.teal.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total Price', style: kHeadingText.copyWith(color: Colors.black,fontSize: 14.0),),
                                      Text(totalPrice.toString() ??'0', style: kSecondaryText,),
                                    ],
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                      ),
                    ),
                    50.0.height,
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: primarybutton(btnText: 'Submit Order',press: () async{
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.rightSlide,
                title: 'Are You Sure To Submit Order?',
                btnOkOnPress: () {
                c.sendOrder(myCartProductList);
                },
                btnCancelOnPress: () {},
                btnCancelText: "No",
                btnOkText: "Yes",
                btnOkColor: kTealColor,
              ).show();
            }),
          ),
        );
      }
    );
  }
}
