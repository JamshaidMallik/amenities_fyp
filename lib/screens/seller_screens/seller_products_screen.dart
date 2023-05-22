import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/screens/seller_screens/seller_add_product.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../controller/auth_controller.dart';
import '../../model/product_model.dart';

class SellerProductsScreen extends StatelessWidget {
  final String userId;
   SellerProductsScreen(this.userId, {Key? key}) : super(key: key);

  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    controller.getProducts(userId:userId);
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Center(child: Text(c.productList.length.toString(),style: kHeadingText,)),
                ),
              ],
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
                                if(kStorage.read(kUserType) == 'Seller')
                                TextButton(onPressed: (){
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.question,
                                    animType: AnimType.rightSlide,
                                    title: 'Are you sure you want to Delete',
                                    btnCancelOnPress: () {
                                      Get.back();
                                    },
                                    btnOkOnPress: () async{
                                      c.deleteProduct(productId: product.id, index: index,imageUrl: product.image);
                                    },
                                    btnCancelText: 'Cancel',
                                    btnOkText: "Delete",
                                    btnOkColor: Colors.teal,
                                  ).show();
                                }
                                    ,child: const Text('Delete', style: TextStyle(color: Colors.red),)),
                                //
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
            floatingActionButton:
            FloatingActionButton(
              elevation: 0.0,
              backgroundColor: kStorage.read(kUserType) == 'Seller' ?  kTealColor: Colors.transparent,
              onPressed: kStorage.read(kUserType) == 'Seller' ?  () {
                Get.to(() => const SellerAddProduct());
              }:null,
              child:  kStorage.read(kUserType) == 'Seller' ?  Icon(Icons.add): null,
            ),
          );
        });
  }
}
