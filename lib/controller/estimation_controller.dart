import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController {

  final residentialAreaFormKey = GlobalKey<FormState>();

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

  /// firstFloor controller
  TextEditingController firstFloorTotalRoom = TextEditingController();
  TextEditingController firstFloorKitchenController = TextEditingController();
  TextEditingController firstFloorWashroomController = TextEditingController();

  /// secondFloor controller
  TextEditingController secondFloorRoomController = TextEditingController();
  TextEditingController secondFloorKitchenController = TextEditingController();
  TextEditingController secondFloorWashroomController = TextEditingController();

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
        int totalKitchen = int.tryParse(firstFloorKitchenController.text) ?? 0;
        int totalWashroom = int.tryParse(firstFloorWashroomController.text) ?? 0;


        // Calculate estimation for 1 floor
        estimatedBricks = (areaInMarla * totalRooms * totalKitchen * totalWashroom * 1000).toInt();
        estimatedSand = (areaInMarla * totalRooms * totalKitchen * totalWashroom * 10).toInt();
        estimatedGravel = (areaInMarla * totalRooms * totalKitchen * totalWashroom * 20).toInt();
        estimatedIronRod = (areaInMarla * totalRooms * totalKitchen * totalWashroom * 25).toInt();
        estimatedCement = (areaInMarla * totalRooms * totalKitchen * totalWashroom * 10).toInt();
      } else if (chooseFloorValue == 2) {
        int firstFloorTotalRooms = int.tryParse(firstFloorTotalRoom.text) ?? 0;
        int secondFloorTotalRooms = int.tryParse(secondFloorRoomController.text) ?? 0;
        int firstFloorKitchen = int.tryParse(firstFloorKitchenController.text) ?? 0;
        int secondFloorKitchen = int.tryParse(secondFloorKitchenController.text) ?? 0;
        int firstFloorWashroom = int.tryParse(firstFloorWashroomController.text) ?? 0;
        int secondFloorWashroom = int.tryParse(secondFloorWashroomController.text) ?? 0;
        // Calculate estimation for 2 floors
        estimatedBricks = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorKitchen + secondFloorKitchen + firstFloorWashroom + secondFloorWashroom) * 1000).toInt();
        estimatedSand = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorKitchen + secondFloorKitchen + firstFloorWashroom + secondFloorWashroom) * 10).toInt();
        estimatedGravel = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms+ firstFloorKitchen + secondFloorKitchen + firstFloorWashroom + secondFloorWashroom) * 20).toInt();
        estimatedIronRod = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms+ firstFloorKitchen + secondFloorKitchen + firstFloorWashroom + secondFloorWashroom) * 25).toInt();
        estimatedCement = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms+ firstFloorKitchen + secondFloorKitchen + firstFloorWashroom + secondFloorWashroom) * 10).toInt();
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
    firstFloorKitchenController.clear();
    secondFloorKitchenController.clear();
    firstFloorWashroomController.clear();
    secondFloorWashroomController.clear();
    chooseFloorValue = null;
    chooseAreaValue = null;
  }
}
