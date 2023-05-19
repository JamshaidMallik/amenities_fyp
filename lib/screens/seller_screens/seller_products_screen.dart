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
            appBar: AppBar(
              title: const Text('Products'),
            ),
            body: c.isProductLoading.isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : c.productList.isNotEmpty? ListView.builder(
                itemCount: c.productList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Product product = c.productList[index];
                  bool last = index == c.productList.length - 1? true : false;
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
                                  fadeInDuration: const Duration(seconds: 1),
                                  placeholder: placeHolderPic,
                                  image: product.image,
                                  fit: BoxFit.cover,
                                  placeholderFit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  product.productName,
                                  style: kHeadingText
                                ),
                                const Spacer(),
                                TextButton(onPressed: ()=> c.deleteProduct(productId: product.id, index: index,imageUrl: product.image), child: const Text('Delete', style: TextStyle(color: Colors.red),)),
                              ],
                            ),
                            if(last)
                              70.0.height,
                          ],
                        ),
                      ],
                    ),
                  );
                }): const Center(child: Text('No Products')),
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
