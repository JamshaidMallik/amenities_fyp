import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class EstimateRawMaterialScreen extends StatelessWidget {
  const EstimateRawMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estimate',
          style: kSubHeadingText,
        ),
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
      body: Column(
        children: [
          30.0.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      // onTap: (){
                      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>InputEstimateScreen()));
                      // },
                      child: Container(
                        child: Image.network(
                            "https://s.alicdn.com/@sc04/kf/Ac3f0ecc79a334393bb8d2e8c2ce52ea0I.png_300x300.png"),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                    ),
                    Text("Cement")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR66RqWP4uFp8cSJooxZCJo2wrH50u3IindFUoZGvVkjsPcw7QZ_hZp5-dKz4K9Xs5UO5o&usqp=CAU",
                        fit: BoxFit.cover,
                      ),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                    ),
                    Text("Bricks")
                  ],
                ),
              ),
            ],
          ),
          30.0.height,
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                          "https://sc04.alicdn.com/kf/S5ca22ca7db304453a1dab3c8840371b20.jpg"),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                    ),
                    Text("IronBar")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                          "https://5.imimg.com/data5/SELLER/Default/2021/11/PN/KO/CP/142456981/single-water-wash-m-sand-250x250.jpg"),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                    ),
                    Text("Sand")
                  ],
                ),
              ),
            ],
          ),
          70.0.height,
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/51iR4CgGOGS._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg",
                        fit: BoxFit.cover,
                      ),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                    ),
                    Text("Gravel")
                  ],
                ),
              ),
            ],
          ),
          // 10.0.height,
          // Row(
          //   children: [
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             child: Center(child: Text("10",style: kBigHeadingText,)),
          //             height: 100,
          //             width: 100,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.red),
          //           ),
          //           Text("Marla")
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Column(
          //         children: [
          //           Container(
          //             child: Center(child: Text("15",style: kBigHeadingText,)),
          //             height: 100,
          //             width: 100,
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: Colors.red),
          //           ),
          //           Text("Marla")
          //         ],
          //       ),
          //     ),
          //
          //   ],
          // ),
          40.0.height,
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EstimateRawMaterialScreen()));
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Order Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
