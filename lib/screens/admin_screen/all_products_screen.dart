import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/admin_controller.dart';
import '../../widgets/photo_view.dart';

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
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(product.productName, style: kSubHeadingText.copyWith(fontSize: 18.0),),
                                 Text('${product.price} ${product.size}', style: kPrimaryGrayText.copyWith(fontSize: 15.0),),
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
              })
              : const Center(child: Text('No Products')),
        );
      }
    );
  }
}
