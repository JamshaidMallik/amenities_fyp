import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/screens/seller_screens/seller_add_product.dart';
import 'package:amenities_app/screens/user_screens/cart_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../model/product_model.dart';
import '../../widgets/custom_text_field.dart';

class SellerProductsScreen extends StatelessWidget {
  final String userId;
  SellerProductsScreen(this.userId, {Key? key}) : super(key: key);
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.getProducts(userId: userId);
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              actions: [
                kStorage.read(kUserType) != 'Admin'
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => const CartScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Center(
                            child: c.myCartProductList.isNotEmpty
                                ? Badge(
                                    backgroundColor: Colors.red,
                                    label: Text(
                                        c.myCartProductList.length.toString()),
                                    child: const Icon(Icons.shopping_cart))
                                : const Icon(Icons.shopping_cart),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            body: c.isProductLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : c.productList.isNotEmpty
                    ? ListView.builder(
                        itemCount: c.productList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Product product = c.productList[index];
                          bool last =
                              index == c.productList.length - 1 ? true : false;
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage.assetNetwork(
                                          fadeInDuration:
                                              const Duration(seconds: 1),
                                          placeholder: placeHolderPic,
                                          image: product.image,
                                          fit: BoxFit.cover,
                                          placeholderFit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(product.productName,
                                            style: kHeadingText),
                                        const Spacer(),
                                        if (kStorage.read(kUserType) ==
                                            'Seller')
                                          TextButton(
                                              onPressed: () {
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType:
                                                      DialogType.question,
                                                  animType: AnimType.rightSlide,
                                                  title:
                                                      'Are you sure you want to Delete this Product?',
                                                  btnCancelOnPress: () {
                                                    Get.back();
                                                  },
                                                  btnOkOnPress: () async {
                                                    c.deleteProduct(
                                                        productId: product.id,
                                                        index: index,
                                                        imageUrl:
                                                            product.image);
                                                  },
                                                  btnCancelText: 'Cancel',
                                                  btnOkText: "Delete",
                                                  btnOkColor: Colors.teal,
                                                ).show();
                                              },
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                        if (kStorage.read(kUserType) == 'User')
                                          TextButton(
                                              onPressed: () {
                                                Get.bottomSheet(
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            'Enter Quantity',
                                                            style: kHeadingText,
                                                          ),
                                                          10.0.height,
                                                          Text(
                                                            'Please Enter New Quantity That You Want To Buy',
                                                            style: kPrimaryGrayText
                                                                .copyWith(
                                                                    fontSize:
                                                                        14.0),
                                                          ),
                                                          10.0.height,
                                                          customTextField(
                                                            hintText:
                                                                'Enter Your Quantity',
                                                            controller: c
                                                                .myCartQuantityController,
                                                          ),
                                                          20.0.height,
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    MaterialButton(
                                                                  textColor:
                                                                      kWhiteColor,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: const Text(
                                                                      'Close'),
                                                                ),
                                                              ),
                                                              20.0.width,
                                                              Expanded(
                                                                child:
                                                                    MaterialButton(
                                                                  textColor:
                                                                      kWhiteColor,
                                                                  color:
                                                                      kPrimaryColor,
                                                                  onPressed:
                                                                      () {
                                                                    if(c.myCartQuantityController.text.isEmpty){
                                                                      Get.snackbar(
                                                                        "Important",
                                                                        "Please Enter Quantity",
                                                                        backgroundColor: Colors.red,
                                                                        snackPosition: SnackPosition.TOP,
                                                                        colorText: kWhiteColor,
                                                                        duration: const Duration(seconds: 3),
                                                                      );
                                                                    }else{
                                                                      c.addToCartItem(
                                                                          name: product.productName,
                                                                          quantity: c.myCartQuantityController.text,
                                                                          addUserID: kStorage.read(kUserId) ?? '',
                                                                          productId: product.id,
                                                                          productUserId: product.userId,
                                                                          productImage: product.image);
                                                                      c.myCartQuantityController.clear();
                                                                      Get.back();
                                                                    }
                                                                  },
                                                                  child: const Text(
                                                                      'Update'),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          20.0.height,
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text(
                                                'Add To Cart',
                                                style: TextStyle(
                                                    color: kPrimaryColor),
                                              )),
                                      ],
                                    ),
                                    if (last) 70.0.height,
                                  ],
                                ),
                              ],
                            ),
                          );
                        })
                    : const Center(child: Text('No Products')),
            floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              backgroundColor: kStorage.read(kUserType) == 'Seller'
                  ? kTealColor
                  : Colors.transparent,
              onPressed: kStorage.read(kUserType) == 'Seller'
                  ? () {
                      Get.to(() => const SellerAddProduct());
                    }
                  : null,
              child: kStorage.read(kUserType) == 'Seller'
                  ? const Icon(Icons.add)
                  : null,
            ),
          );
        });
  }
}
