import 'package:amenities_app/constant.dart';
import 'package:amenities_app/screens/user_screens/user_main_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/auth_controller.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/custom_text_field.dart';

class CheckOutScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
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

                      Text('Fill In the Blanks',style: kSubHeadingText,),
                        10.0.height,
                      customTextField(controller: controller.emailController, hintText: 'Name'),
                      20.0.height,
                      customTextField(controller: controller.emailController, hintText: 'Address'),
                      20.0.height,
                      customTextField(controller: controller.emailController, hintText: 'Email'),
                      20.0.height,
                      customTextField(controller: controller.emailController, hintText: 'Contect No:'),
                    ],),
                  ),
                ),

                10.0.height,
               ExpansionTile(title: Text("Total"),
               children: [
                 Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.teal.shade300,
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Product1",
                               style: kSecondaryText,
                             ),
                             Text(
                               "0.00",
                               style: kSecondaryText,
                             ),
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Product2",
                               style: kSecondaryText,
                             ),
                             Text(
                               "0.00",
                               style: kSecondaryText,
                             ),
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "Text",
                               style: kSecondaryText,
                             ),
                             Text(
                               "0.00",
                               style: kSecondaryText,
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ),
               ],),
                10.0.height,
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text(
                          "0.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: primarybutton(btnText: 'Confirm Order',press: () async{
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Your order confirm',
            // btnCancelOnPress: () {},
            btnOkOnPress: () {
              Get.to(()=>UserMainScreen());
            },
            btnOkText: "Continue shopping",
            btnOkColor: kTealColor,
          ).show();
        }),
      ),
    );
  }
}
