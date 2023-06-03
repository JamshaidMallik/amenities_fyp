import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController {
  String? chooseAreaValue;
  List<String> areaList = [
    "3 Marla",
    "4 Marla",
    "5 Marla",
    "7 Marla",
    "10 Marla",
    "1 Kanal",
    "2 Kanal",
  ];
  void chooseArea(String? value) {
    chooseAreaValue = value;
    if (value != null) {
      String intValue = value.split(' ')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      log('selectedValue $selectedValue');
    }
    update();
  }

  int? chooseFloorValue;
  List<int> floorList = [
    1,
    2,
  ];
  void chooseFloor(int? value) {
    chooseFloorValue = value;
    if (value != null) {
      log('selectedValue $chooseFloorValue');
    }
    update();
  }
  /// Residential area values
  TextEditingController firstFloorTotalRoom = TextEditingController();
  TextEditingController secondFloorRoomController = TextEditingController();

  int estimatedBricks = 0;
  int estimatedSand = 0;
  int estimatedGravel = 0;
  int estimatedIronRod = 0;
  int estimatedCement = 0;
  void calculateEstimation() {
    if (chooseAreaValue != null) {
      String intValue = chooseAreaValue!.split(' ')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      double conversionFactor = 1.0;
      if (chooseAreaValue!.contains("Kanal")) {
        // Convert Kanal to Marla
        conversionFactor = 20.0;
      }
      double areaInMarla = selectedValue * conversionFactor;

      if (chooseFloorValue == 1) {
        int totalRooms = int.tryParse(firstFloorTotalRoom.text) ?? 0;
        // Calculate estimation for 1 floor
        estimatedBricks = (areaInMarla * totalRooms * 1000).toInt();
        estimatedSand = (areaInMarla * totalRooms * 10).toInt();
        estimatedGravel = (areaInMarla * totalRooms * 20).toInt();
        estimatedIronRod = (areaInMarla * totalRooms * 25).toInt();
        estimatedCement = (areaInMarla * totalRooms * 10).toInt();
      } else if (chooseFloorValue == 2) {
        int firstFloorTotalRooms = int.tryParse(firstFloorTotalRoom.text) ?? 0;
        int secondFloorTotalRooms = int.tryParse(secondFloorRoomController.text) ?? 0;
        // Calculate estimation for 2 floors
        estimatedBricks = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms) * 1000).toInt();
        estimatedSand = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms) * 10).toInt();
        estimatedGravel = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms) * 20).toInt();
        estimatedIronRod = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms) * 25).toInt();
        estimatedCement = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms) * 10).toInt();
      }
      log('Estimated Bricks: $estimatedBricks');
      log('Estimated Sand: $estimatedSand');
      log('Estimated Gravel: $estimatedGravel');
      log('Estimated Iron Rod: $estimatedIronRod');
      log('Estimated Cement: $estimatedCement');
    }
  }



  @override
  void dispose() {
    super.dispose();
    firstFloorTotalRoom.clear();
    secondFloorRoomController.clear();
    chooseFloorValue = null;
    chooseAreaValue = null;
  }
}
