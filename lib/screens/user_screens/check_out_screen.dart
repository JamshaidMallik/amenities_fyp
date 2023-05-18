import 'package:amenities_app/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Your Cart'),
        leading: const Icon(
          Icons.menu,
          color: kWhiteColor,
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Add Your Details:"),
            10.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Name", border: InputBorder.none),
                ),
              ),
            ),
            10.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Address", border: InputBorder.none),
                ),
              ),
            ),
            10.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Email", border: InputBorder.none),
                ),
              ),
            ),
            10.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Contect No", border: InputBorder.none),
                ),
              ),
            ),
            10.0.height,
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
                    const Text("Total",style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text("0.00",style: TextStyle(fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
            ),
            50.0.height,
            GestureDetector(
              onTap: (){
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.rightSlide,
                  title: 'Your order confirm',
                  // btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                  btnOkText: "Continue shopping",
                  btnOkColor: kTealColor,
                ).show();
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
                      "Confirm Detail",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
