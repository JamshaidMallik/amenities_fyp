import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/product_controller.dart';
import '../../model/product_model.dart';
import '../../widgets/photo_view.dart';
import 'quantity_bottom_sheet.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> searchStream;

  @override
  void initState() {
    super.initState();
    searchStream = kFireStore.collection(kProductCollection).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: TextField(
              onChanged: (value) {
                setState(() {
                  bool isNumeric = double.tryParse(value) != null;

                  if (isNumeric) {
                    searchStream = kFireStore
                        .collection(kProductCollection)
                    .where('product_price', isGreaterThanOrEqualTo: value.toString())
                        .snapshots();
                  } else {
                    searchStream = kFireStore
                        .collection(kProductCollection)
                        .where('uppercase_name', isGreaterThanOrEqualTo: value.toUpperCase())
                        .snapshots();
                  }



                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white60),
                border: InputBorder.none,
              ),
            ),
          ),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: searchStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final item = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    Product product = Product.fromSnapshot(item[index]);
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
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error fetching data'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }
    );
  }
}
