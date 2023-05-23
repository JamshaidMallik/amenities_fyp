import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kGreyColor),
                          child: Center(
                              child: Text(
                            "3",
                            style: kBigHeadingText,
                          )),
                        ),
                      ),
                      const Text("Marla")
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
                            borderRadius: BorderRadius.circular(10),
                            color: kGreyColor),
                        child: Center(
                            child: Text(
                          "5",
                          style: kBigHeadingText,
                        )),
                      ),
                      const Text("Marla")
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
