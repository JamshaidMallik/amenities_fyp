import 'dart:developer';
import 'package:amenities_app/controller/product_controller.dart';
import 'package:amenities_app/model/my_cart_model.dart';
import 'package:amenities_app/screens/user_screens/cart_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/photo_view.dart';
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
                ? SingleChildScrollView(
                  child: Column(
                    children: [
                      10.0.height,
                      Text(
                        'Swipe Left for delete item',
                        style: kPrimaryGrayText,
                      ),
                      10.0.height,
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 8.0,
                                  shadowColor: kPrimaryColor,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            Get.to(()=> PhotoViewPage(item.productImage));
                                          },
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: kTealColor,
                                                maxRadius: 30,
                                                backgroundImage: NetworkImage(item.productImage),

                                              ),
                                              10.0.width,
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      item.name,
                                                      style: kHeadingText,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Price:  ', style: kHeadingText.copyWith(fontSize: 12)),
                                                        Text(item.price.toString(), style: kSecondaryText),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Quantity:  ', style: kHeadingText.copyWith(fontSize: 12)),
                                                        Text(item.quantity, style: kSecondaryText),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text('Total Price:  ', style: kHeadingText.copyWith(fontSize: 12)),
                                                        Text(item.totalPrice.toString(), style: kSecondaryText),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              MaterialButton(
                                                color: kTealColor,
                                                textColor: Colors.white,
                                                onPressed: () {
                                                  Get.bottomSheet(
                                                    CartPageBottomSheet(item),
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
                                      Positioned(
                                        top: 0,
                                        child: Checkbox(
                                          side:  BorderSide(color: kGreyColor.withOpacity(0.3)),
                                          fillColor: MaterialStateProperty.all(kTealColor),
                                          value: item.isSelected,
                                          onChanged: (_) {
                                            c.toggleCartItemSelection(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                      80.0.height,
                    ],
                  ),
                )
                : const Center(
                    child: Text('No Item in Cart'),
                  ),
            bottomSheet: c.myCartProductList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: primarybutton(
                        btnText: c.totalCartOriginalPrice != 0? 'Check Out ${int.parse(c.totalCartOriginalPrice.toStringAsFixed(0))}' : 'Check Out',
                        press: () async {
                          List<MyCartProduct> selectedItems = c.getSelectedCartItems();
                              if( selectedItems.isNotEmpty){
                                Get.to(() =>  CheckOutScreen(
                                  selectedItems,
                                  c.totalCartOriginalPrice,
                                ));
                              }else{
                                kShowSnackBar(context: context, message: 'Please select at least one item For Checkout', isSuccess: false);
                              }

                        }),
                  )
                : const SizedBox(
                    height: 100,
                    width: 100,
                  ),
          );
        });
  }
}
