import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerAddProduct extends StatelessWidget {
  const SellerAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add Products"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        child: Center(
                          child: GestureDetector(
                            onTap: () => c.pickImage(),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.teal.shade300,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    "Select image",
                                    style: kPrimaryWhiteText.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      c.image == null
                          ? Container()
                          : SizedBox(
                              height: 150,
                              width: 150,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.file(
                                    c.image!,
                                    height: 200,
                                    width: 200,
                                  ))),
                    ],
                  ),
                  15.0.height,
                  customTextField(
                      controller: c.productNameController,
                      hintText: 'Enter Product Name'),
                  const Spacer(),
                  primarybutton(btnText: 'Save Product',press: (){
                    c.addProduct();
                  }),
                ],
              ),
            ),
          );
        });
  }
}
