import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        leading: Icon(
          Icons.menu,
          color: kWhiteColor,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                            color: kRedColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Product Name"),
                          Text("Supliar"),
                        ],
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.remove),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal,
                              ),
                            ),
                            Text("1"),
                            Container(
                              child: Center(child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.add,color: Colors.white,),
                              )),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                        height: 50,
                        width: 100,
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
