import 'package:amenities_app/controller/estimation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'cart_screen.dart';

class EstimateResultScreen extends StatelessWidget {
  const EstimateResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimationController>(
      init: EstimationController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Estimate Result',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://s.alicdn.com/@sc04/kf/Ac3f0ecc79a334393bb8d2e8c2ce52ea0I.png_300x300.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: kGreyColor),
                          ),
                          10.0.height,
                          Text("Cement ${c.estimatedCement.toInt()}", style: kHeadingText,)
                        ],
                      ),
                    ),
                    10.0.width,
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR66RqWP4uFp8cSJooxZCJo2wrH50u3IindFUoZGvVkjsPcw7QZ_hZp5-dKz4K9Xs5UO5o&usqp=CAU"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10),
                                color: kGreyColor),
                          ),
                          10.0.height,
                           Text("Bricks ${c.estimatedBricks}", style: kHeadingText,)
                        ],
                      ),
                    ),
                  ],
                ),
                10.0.height,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://m.media-amazon.com/images/I/51iR4CgGOGS._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10),
                                color: kGreyColor),
                          ),
                           10.0.height,
                           Text("Gravel ${c.estimatedGravel.toInt()}", style: kHeadingText,)
                        ],
                      ),
                    ),
                    10.0.width,
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://5.imimg.com/data5/SELLER/Default/2021/11/PN/KO/CP/142456981/single-water-wash-m-sand-250x250.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: kGreyColor),
                          ),
                          10.0.height,
                           Text("Sand ${c.estimatedSand.toInt()}", style: kHeadingText,),
                        ],
                      ),
                    ),
                  ],
                ),
                15.0.height,
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image:  const DecorationImage(
                          image: NetworkImage(
                              "https://sc04.alicdn.com/kf/S5ca22ca7db304453a1dab3c8840371b20.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                ),
                 10.0.height,
                 Text("Iron Rod ${c.estimatedIronRod.toInt()}", style: kHeadingText,),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CartScreen()));
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
                            "Order Now  ",
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
          ),
        );
      }
    );
  }
}
