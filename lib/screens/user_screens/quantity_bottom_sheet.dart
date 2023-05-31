import 'package:amenities_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/product_controller.dart';
import '../../widgets/custom_text_field.dart';

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
            // Dismiss the bottom sheet when tapping outside the content
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Quantity',
                    style: kHeadingText,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Please Enter Quantity That You Want To Buy',
                    style: kPrimaryGrayText.copyWith(fontSize: 14.0),
                  ),
                  const SizedBox(height: 10.0),
                  customTextField(
                    hintText: 'Example 350 Feet',
                    controller: c.myCartQuantityController,
                    keyboardType: TextInputType.number,
                  ),
                  10.0.height,
                  Row(
                    children: [
                      Text('Note: ', style: kPrimaryGrayText.copyWith(fontSize: 10.0),),
                      Text('Please add values in feet ', style: kPrimaryGrayText.copyWith(fontSize: 10.0),),
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
                            } else {
                              c.addToCartItem(
                                name: product.productName,
                                quantity: c.myCartQuantityController.text,
                                addUserID: kStorage.read(kUserId) ?? '',
                                productId: product.id,
                                productUserId: product.userId,
                                productImage: product.image,
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
        );
      }
    );
  }
}
