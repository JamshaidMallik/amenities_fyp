
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'input_estimate_screen.dart';

class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Area',
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>InputEstimateScreen()));
                          },
                          child: Container(
                            child: Center(child: Text("3",style: kBigHeadingText,)),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:kGreyColor),
                          ),
                        ),
                        Text("Marla")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("5",style: kBigHeadingText,)),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Marla")
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
                        child: Center(child: Text("6",style: kBigHeadingText,)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                      ),
                      Text("Marla")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("7",style: kBigHeadingText,)),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Marla")
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
                        child: Center(child: Text("8",style: kBigHeadingText,)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                      ),
                      Text("Marla")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("9",style: kBigHeadingText,)),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Marla")
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
                        child: Center(child: Text("10",style: kBigHeadingText,)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                      ),
                      Text("Marla")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("15",style: kBigHeadingText,)),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Marla")
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
                        child: Center(child: Text("1",style: kBigHeadingText,)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                      ),
                      Text("Kanal")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("2",style: kBigHeadingText,)),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                      ),
                      Text("Kanal")
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
                        child: Center(child: Text("4",style: kBigHeadingText,)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                      ),
                      Text("Kanal")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                        child: Center(child: Text("5",style: kBigHeadingText,)),
                      ),
                      Text("Kanal")
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
