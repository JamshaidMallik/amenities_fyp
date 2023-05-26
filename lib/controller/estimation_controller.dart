import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController {
  TextEditingController floorController = TextEditingController();

  /// Residential area values
  TextEditingController customAreaController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController roomDimensionController = TextEditingController();
  TextEditingController roomHeightController = TextEditingController();
  TextEditingController roomWidthController = TextEditingController();
  TextEditingController roomLengthController = TextEditingController();

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

  int estimatedBricks = 0;
  double estimatedSand = 0.0;
  double estimatedGravel = 0.0;
  double estimatedIronRod = 0.0;
  double estimatedCement = 0.0;


  void chooseArea(String? value) {
    valueChoose = value;
    if (value != null) {
      String intValue = value.split(' ')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      log('selectedValue $selectedValue');
    }
    update();
  }

     calculateEstimation()async {
     if (valueChoose != null && valueChoose != "Custom") {
      String intValue = valueChoose!.split(' ')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      double areaInMarla = selectedValue.toDouble();

      // Calculate the estimation based on the selected area
      estimatedBricks = calculateBricks(areaInMarla);
      estimatedSand = calculateSand(areaInMarla);
      estimatedGravel = calculateGravel(areaInMarla);
      estimatedIronRod = calculateIronRod(areaInMarla);
      estimatedCement = calculateCement(areaInMarla);
      log('estimatedBricks $estimatedBricks');
      log('estimatedSand $estimatedSand');
      log('estimatedGravel $estimatedGravel');
      log('estimatedIronRod $estimatedIronRod');
      log('estimatedCement $estimatedCement');
    }
    update();
  }

  int calculateBricks(double areaInMarla) {
    // Perform calculation for estimating the number of bricks needed
    // Example formula: Number of bricks = areaInMarla * 1000
    return (areaInMarla * 1000).toInt();
  }
  double calculateSand(double areaInMarla) {
    // Perform calculation for estimating the quantity of sand needed
    // Example formula: Quantity of sand = areaInMarla * 2.5
    return areaInMarla * 2.5;
  }
  double calculateGravel(double areaInMarla) {
    // Perform calculation for estimating the quantity of gravel needed
    // Example formula: Quantity of gravel = areaInMarla * 3.8
    return areaInMarla * 3.8;
  }
  double calculateIronRod(double areaInMarla) {
    // Perform calculation for estimating the quantity of iron rod needed
    // Example formula: Quantity of iron rod = areaInMarla * 4.2
    return areaInMarla * 4.2;
  }
  double calculateCement(double areaInMarla) {
    // Perform calculation for estimating the quantity of cement needed
    // Example formula: Quantity of cement = areaInMarla * 3.2
    return areaInMarla * 3.2;
  }




}
