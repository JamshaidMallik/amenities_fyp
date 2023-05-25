import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/admin_controller.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      init: AdminController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('All Products'),
          ),
          body: c.isProductLoading.isTrue
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : c.allProductList.isNotEmpty
              ? ListView.builder(
              itemCount: c.allProductList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
               var product = c.allProductList[index];
                bool last = index == c.allProductList.length - 1 ? true : false;
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
        );
      }
    );
  }
}
