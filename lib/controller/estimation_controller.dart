import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController {
  TextEditingController floorController = TextEditingController();
  String? valueChoose;
  List<String> listItem = [
    "1 Marla",
    "2 Marla",
    "3 Marla",
    "4 Marla",
    "5 Marla",
    "6 Marla",
    "7 Marla",
    "8 Marla",
    "9 Marla",
    "10 Marla",
    "Custom"
  ];
  void chooseArea(String? value) {
    valueChoose = value;
    if (value != null) {
      String intValue = value.split(' ')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      log('selectedValue $selectedValue');
    }
    update();
  }

  /// Residential area values
  TextEditingController customAreaController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController roomHeightController = TextEditingController();
  TextEditingController roomWidthController = TextEditingController();
  TextEditingController roomLengthController = TextEditingController();

  int estimatedBricks = 0;
  double estimatedSand = 0.0;
  double estimatedGravel = 0.0;
  double estimatedIronRod = 0.0;
  double estimatedCement = 0.0;
  // void calculateEstimation() {
  //   int roomCount = int.tryParse(roomController.text) ?? 0;
  //   double customArea = double.tryParse(customAreaController.text) ?? 0.0;
  //   double roomHeight = double.tryParse(roomHeightController.text) ?? 0.0;
  //   double roomWidth = double.tryParse(roomWidthController.text) ?? 0.0;
  //   double roomLength = double.tryParse(roomLengthController.text) ?? 0.0;
  //
  //   // Get the selected area value
  //   if (valueChoose != null) {
  //     if (valueChoose == "Custom") {
  //       // Perform estimation calculations for custom area
  //       estimatedBricks = (customArea * roomHeight * roomWidth * roomLength).toInt();
  //     } else {
  //       String intValue = valueChoose!.split(' ')[0];
  //       int selectedValue = int.tryParse(intValue) ?? 0;
  //       log('selectedValue $selectedValue');
  //       // Perform estimation calculations based on the selected area
  //       estimatedBricks = selectedValue * roomHeight.toInt() * roomWidth.toInt() * roomLength.toInt();
  //     }
  //
  //     // Perform other estimation calculations as needed
  //     estimatedSand = roomHeight * roomWidth * roomLength * 0.5; // Sample calculation
  //     estimatedGravel = roomHeight * roomWidth * roomLength * 0.75; // Sample calculation
  //     estimatedIronRod = roomWidth + roomLength; // Sample calculation
  //     estimatedCement = roomHeight + roomWidth + roomLength; // Sample calculation
  //   }
  //
  //   update();
  // }

  void calculateEstimation() {
    int roomCount = int.tryParse(roomController.text) ?? 0;
    double customArea = double.tryParse(customAreaController.text) ?? 0.0;
    double roomHeight = double.tryParse(roomHeightController.text) ?? 0.0;
    double roomWidth = double.tryParse(roomWidthController.text) ?? 0.0;
    double roomLength = double.tryParse(roomLengthController.text) ?? 0.0;

    // Get the selected area value
    if (valueChoose != null) {
      if (valueChoose == "Custom") {
        // Perform estimation calculations for custom area
        estimatedBricks =
            (customArea * roomCount * roomHeight * roomWidth * roomLength)
                .toInt();
        estimatedSand = roomCount *
            roomHeight *
            roomWidth *
            roomLength *
            0.5; // Sample calculation
        estimatedGravel = roomCount *
            roomHeight *
            roomWidth *
            roomLength *
            0.75; // Sample calculation
        estimatedIronRod =
            roomCount * (roomWidth + roomLength); // Sample calculation
        estimatedCement = roomCount *
            (roomHeight + roomWidth + roomLength); // Sample calculation
      } else {
        String intValue = valueChoose!.split(' ')[0];
        int selectedValue = int.tryParse(intValue) ?? 0;
        log('selectedValue $selectedValue');
        // Perform estimation calculations based on the selected area
        estimatedBricks = selectedValue *
            roomCount *
            roomHeight.toInt() *
            roomWidth.toInt() *
            roomLength.toInt();

        // Perform other estimation calculations as needed
        estimatedSand = roomCount *
            roomHeight *
            roomWidth *
            roomLength *
            0.5; // Sample calculation
        estimatedGravel = roomCount *
            roomHeight *
            roomWidth *
            roomLength *
            0.75; // Sample calculation
        estimatedIronRod =
            roomCount * (roomWidth + roomLength); // Sample calculation
        estimatedCement = roomCount *
            (roomHeight + roomWidth + roomLength); // Sample calculation
      }
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
    customAreaController.clear();
    roomHeightController.clear();
    roomWidthController.clear();
    roomLengthController.clear();
    roomController.clear();
  }
}
