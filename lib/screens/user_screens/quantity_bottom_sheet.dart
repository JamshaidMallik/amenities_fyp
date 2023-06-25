import 'dart:developer';

import 'package:amenities_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/product_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/photo_view.dart';

class MyBottomSheet extends StatelessWidget {
  final Product product;
  const MyBottomSheet(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> PhotoViewPage(product.image));
                        },
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              product.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Product Name: ${product.productName}',
                        style: kSubHeadingText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ${product.price}',
                            style: kSubHeadingText,
                          ),
                        ],
                      ),
                      10.0.height,
                      Text(
                        'Enter Quantity',
                        style: kHeadingText.copyWith(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Please Enter Quantity That You Want To Buy',
                        style: kPrimaryGrayText.copyWith(fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: customTextField(
                              hintText: 'Enter Quantity',
                              controller: c.myCartQuantityController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          10.0.width,
                        ],
                      ),
                      10.0.height,
                      Row(
                        children: [
                          Text(
                            'Note: ',
                            style: kPrimaryGrayText.copyWith(fontSize: 10.0),
                          ),
                          Text(
                            'Please add values in feet like (150) feet ',
                            style: kPrimaryGrayText.copyWith(fontSize: 10.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              textColor: kWhiteColor,
                              color: kPrimaryColor,
                              onPressed: () {
                                Get.back();
                                c.myCartQuantityController.clear();
                              },
                              child: const Text('Close'),
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: MaterialButton(
                              textColor: kWhiteColor,
                              color: kPrimaryColor,
                              onPressed: () {
                                if (c.myCartQuantityController.text.isEmpty) {
                                  Get.snackbar(
                                    "Important",
                                    "Please Enter Quantity",
                                    backgroundColor: Colors.red,
                                    snackPosition: SnackPosition.TOP,
                                    colorText: kWhiteColor,
                                    duration: const Duration(seconds: 3),
                                  );
                                }
                                else {
                                  c.addToCartItem(
                                    name: product.productName,
                                    quantity: c.myCartQuantityController.text,
                                    addUserID: kStorage.read(kUserId) ?? '',
                                    productId: product.id,
                                    productUserId: product.userId,
                                    productImage: product.image,
                                    price: product.price,
                                    totalPrice: product.price,
                                  );
                                  c.myCartQuantityController.clear();
                                  Get.back();
                                }
                              },
                              child: const Text('Add To Cart'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
