import 'package:flutter/material.dart';

import '../../constant.dart';
import 'cart_screen.dart';

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
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://s.alicdn.com/@sc04/kf/Ac3f0ecc79a334393bb8d2e8c2ce52ea0I.png_300x300.png"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Cement")
                    ],
                  ),
                ),
                10.0.width,
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR66RqWP4uFp8cSJooxZCJo2wrH50u3IindFUoZGvVkjsPcw7QZ_hZp5-dKz4K9Xs5UO5o&usqp=CAU"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Bricks")
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
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://sc04.alicdn.com/kf/S5ca22ca7db304453a1dab3c8840371b20.jpg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("IronBar")
                    ],
                  ),
                ),
                10.0.width,
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://5.imimg.com/data5/SELLER/Default/2021/11/PN/KO/CP/142456981/single-water-wash-m-sand-250x250.jpg"),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Sand"),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/51iR4CgGOGS._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    color: kGreyColor),
              ),
            ),
            Text("Gravel"),
            Spacer(),
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
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
}
