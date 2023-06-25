import 'package:amenities_app/constant.dart';
import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => c.pickImage(),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(25),
                        borderPadding: const EdgeInsets.all(6),
                        strokeWidth: 1,
                        color: kPrimaryColor,
                        strokeCap: StrokeCap.round,
                        dashPattern: const [
                          6.0,
                        ],
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 50,
                                  ),
                                  Text(
                                    "Select image",
                                    style: kPrimaryGrayText.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    15.0.height,
                    c.image == null
                        ? Container()
                        : Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                      image: FileImage(c.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: GestureDetector(
                                onTap: () => c.removeImage(),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                    15.0.height,
                    customTextField(
                        controller: c.productNameController,
                        hintText: 'Enter Product Name'),
                    15.0.height,
                    customTextField(
                        controller: c.priceController,
                        hintText: 'Enter Price',
                    keyboardType: TextInputType.number,
                    ),
                    15.0.height,
                    Text('Please add Product size, for example (15 Rs) per brick (200 Rs) cubic feet', style: kPrimaryGrayText.copyWith(fontSize: 9.0),),
                    customTextField(
                        controller: c.sizeController,
                        hintText: 'Add Size',
                    keyboardType: TextInputType.text,
                    ),
                    10.0.height,
                    Text('Please add price of 1 Unit, for example 1 foot Sand price (80), 1 Brick price (20), 1/kg iron rod price (300) and 1 cement bag price (1500)', style: kPrimaryGrayText.copyWith(fontSize: 9.0),),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(12),
              child: primarybutton(
                  btnText: 'Save Product',
                  press: () {
                    c.addProduct(userId: kStorage.read(kUserId));
                  }),
            ),
          );
        });
  }
}
