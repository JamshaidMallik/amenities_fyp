import 'package:amenities_app/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../widgets/custom_text_field.dart';
import 'check_out_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Cart'),
            ),
            body: c.myCartProductList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Swipe Left for delete item', style: kPrimaryGrayText,),
                        10.0.height,
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: c.myCartProductList.length,
                            itemBuilder: (context, index) {
                              var item = c.myCartProductList[index];
                              return Dismissible(
                               direction: DismissDirection.endToStart,
                                key: UniqueKey(),
                                background: Container(
                                  color: Colors.red,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                onDismissed: (_) {
                                  c.removeFromCart(id: item.id);
                                },
                                child: Card(
                                  elevation: 3.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: kTealColor,
                                          maxRadius: 30,
                                          backgroundImage:
                                              NetworkImage(item.productImage),
                                        ),
                                        10.0.width,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: kHeadingText,
                                              ),
                                              Text(item.quantity,
                                                  style: kSecondaryText),
                                            ],
                                          ),
                                        ),
                                        MaterialButton(
                                          color: kTealColor,
                                          textColor: Colors.white,
                                          onPressed: () {
                                            Get.bottomSheet(
                                              Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
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
                                                                fontSize: 14.0),
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
                                                              onPressed: () {
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
                                                                  () async {
                                                                await c
                                                                    .updateMyCartProductQuantity(
                                                                        id: item
                                                                            .id);
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
                                          child: Text(
                                            'Edit',
                                            style: kSecondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                : const Center(
                    child: Text('No Item in Cart'),
                  ),
            bottomSheet: c.myCartProductList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CheckOutScreen()));
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.teal),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                              "Check Out",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 100,
                    width: 100,
                  ),
          );
        });
  }
}
