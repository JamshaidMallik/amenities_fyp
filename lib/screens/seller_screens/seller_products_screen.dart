import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/screens/seller_screens/seller_add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../model/product_model.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return Scaffold(
            body: c.isProductLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                itemCount: c.productList.length,
                itemBuilder: (context, index) {
                  Product product = c.productList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                  color: kRedColor,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        product.image,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              product.productName,
                              style: kHeadingText,
                            ),
                            Text(
                              "Suppliar",
                              style: kSubHeadingText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kTealColor,
              onPressed: () {
                Get.to(() => const SellerAddProduct());
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
