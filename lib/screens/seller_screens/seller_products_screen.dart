import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/screens/seller_screens/seller_add_product.dart';
import 'package:amenities_app/screens/user_screens/cart_screen.dart';
import 'package:amenities_app/screens/user_screens/quantity_bottom_sheet.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../model/product_model.dart';
import '../../widgets/photo_view.dart';
import '../user_screens/user_search_screen.dart';
import 'seller_search_screen.dart';

class SellerProductsScreen extends StatelessWidget {
  final String userId;
  SellerProductsScreen(this.userId, {Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

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
                kStorage.read(kUserType) == 'User' || kStorage.read(kUserType) == 'Seller'
                    ? IconButton(onPressed: (){
                  if(kStorage.read(kUserType) == 'User'){
                    Get.to(() => const UserSearchScreen());
                  }else if (kStorage.read(kUserType) == 'Seller'){
                    Get.to(() => const SellerSearchScreen());
                  }else{
                    return;
                  }
                },
                    icon: const Icon(Icons.search))
                    :Container(),
                kStorage.read(kUserType) != 'Admin' && kStorage.read(kUserType) != 'Seller'
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
                    ? Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ListView.builder(
                          itemCount: c.productList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Product product = c.productList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shadowColor: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 8.0,
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Get.to(()=> PhotoViewPage(product.image));
                                          },
                                          child: SizedBox(
                                            height: 200,
                                            width: double.infinity ,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: FadeInImage.assetNetwork(
                                                fadeInDuration: const Duration(seconds: 1),
                                                placeholder: placeHolderPic,
                                                image: product.image,
                                                fit: BoxFit.cover,
                                                placeholderFit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(product.productName, style: kSubHeadingText.copyWith(fontSize: 16.0),),
                                                  Text('${product.price} ${product.size}', style: kPrimaryGrayText.copyWith(fontSize: 15.0),),
                                                ],
                                              ),
                                              const Spacer(),
                                              if (kStorage.read(kUserType) == 'Seller')
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
                                                        btnCancelText: 'No',
                                                        btnOkText: "Yes",
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
                                                       MyBottomSheet(product),
                                                      );
                                                    },
                                                    child: const Text(
                                                     'Add To Cart',
                                                     style: TextStyle(
                                                         color: kPrimaryColor),
                                                        )),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    15.0.height,
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                    : const Center(child: Text('No Products')),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add Product',
              mini: true,
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
