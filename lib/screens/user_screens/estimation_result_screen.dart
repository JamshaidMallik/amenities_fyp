import 'package:amenities_app/controller/estimation_controller.dart';
import 'package:amenities_app/screens/user_screens/user_main_screen.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

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
            child: SingleChildScrollView(
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
                                      image: CachedNetworkImageProvider(
                                          "https://s.alicdn.com/@sc04/kf/Ac3f0ecc79a334393bb8d2e8c2ce52ea0I.png_300x300.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhiteColor),
                            ),
                            10.0.height,
                            Text("Cement Bag ${c.estimatedCement.toInt()}", style: kHeadingText.copyWith(fontSize: 14.0),)
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
                                  image:  const DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR66RqWP4uFp8cSJooxZCJo2wrH50u3IindFUoZGvVkjsPcw7QZ_hZp5-dKz4K9Xs5UO5o&usqp=CAU"),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhiteColor),
                            ),
                            10.0.height,
                             Text("Bricks ${c.estimatedBricks}", style: kHeadingText.copyWith(fontSize: 14.0),)
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
                                      image: CachedNetworkImageProvider(
                                          "https://m.media-amazon.com/images/I/51iR4CgGOGS._SR600%2C315_PIWhiteStrip%2CBottomLeft%2C0%2C35_SCLZZZZZZZ_FMpng_BG255%2C255%2C255.jpg"),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhiteColor),
                            ),
                             10.0.height,
                             Text("Gravel ${c.estimatedGravel.toInt()} feet", style: kHeadingText.copyWith(fontSize: 14.0))
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
                                      image: CachedNetworkImageProvider(
                                          "https://5.imimg.com/data5/SELLER/Default/2021/11/PN/KO/CP/142456981/single-water-wash-m-sand-250x250.jpg"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10),
                                  color: kWhiteColor),
                            ),
                            10.0.height,
                             Text("Sand ${c.estimatedSand.toInt()} feet", style:  kHeadingText.copyWith(fontSize: 14.0),),
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
                        image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                                "https://sc04.alicdn.com/kf/S5ca22ca7db304453a1dab3c8840371b20.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: kWhiteColor),
                  ),
                  10.0.height,
                  Text("Iron Rod ${c.estimatedIronRod.toInt()} kg", style:  kHeadingText.copyWith(fontSize: 14.0),),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: primarybutton(
                btnText: 'Proceed to Order',
                press: () {
                  c.groundFloorTotalRoom.clear();
                  c.groundFloorWashroomController.clear();
              c.firstFloorTotalRoom.clear();
              c.secondFloorRoomController.clear();
              c.firstFloorWashroomController.clear();
              c.secondFloorWashroomController.clear();
              c.chooseAreaValue = null;
              c.chooseFloorValue = null;
              c.chooseKitchenValue = null;
              c.chooseDrawingRoomValue = null;
              c.chooseTvLounchValue = null;
              c.chooseKitchen2Value = null;
              c.chooseDrawingRoom2Value = null;
              c.chooseTvLounch2Value = null;
             Get.off(() => const UserMainScreen());
            }),
          ),
        );
      }
    );
  }
}
