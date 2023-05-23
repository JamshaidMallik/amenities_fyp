import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../widgets/custom_text_field.dart';
import 'check_out_screen.dart';


class CartScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: NetworkImage("https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg"),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Product Name",style: kHeadingText,),
                          Text("Supliar",style: kSecondaryText.copyWith(color: kRedColor),),
                        ],
                      ),
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.transparent,
                      child: customTextField(controller: controller.emailController, hintText: 'Add Detail'),
                    ),
                    ],
                  ),
                ],
              ),
            );
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CheckOutScreen()));
          },
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.teal),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
