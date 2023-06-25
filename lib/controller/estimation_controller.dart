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
      groundFloorTotalRoom.clear();
      groundFloorWashroomController.clear();
      firstFloorTotalRoom.clear();
      firstFloorTotalRoom.clear();
      firstFloorWashroomController.clear();
      secondFloorRoomController.clear();
      firstFloorWashroomController.clear();
      secondFloorWashroomController.clear();
      chooseFloorValue = null;
      chooseKitchenValue = null;
      chooseDrawingRoomValue = null;
      chooseTvLounchValue = null;
      chooseKitchen2Value = null;
      chooseDrawingRoom2Value = null;
      chooseTvLounch2Value = null;

    }
    update();
  }

  String? chooseFloorValue;
  List<String> floorList = [
    "Ground Floor",
    '1',
    '2',
  ];
  void chooseFloor(String? value) {
    chooseFloorValue = value;
    if (value != null) {
      log('selectedValue $chooseFloorValue');
    }
    update();
  }

  List<String> Kitchen = [
    "None",
    "One",
  ];
  String? chooseKitchenValue;
  void chooseKitchen(String? value) {
    chooseKitchenValue = value;
    if (value != null) {
      log('selectedValue $chooseKitchenValue');
    }
    update();
  }

  List<String> DrawingRoom = [
    "None",
    "One",
  ];
  String? chooseDrawingRoomValue;
  void chooseDrawingRoom(String? value) {
    chooseDrawingRoomValue = value;
    if (value != null) {
      log('selectedValue $chooseDrawingRoomValue');
    }
    update();
  }

  List<String> TvLounch = [
    "None",
    "One",
  ];
  String? chooseTvLounchValue;
  void chooseTvLounch(String? value) {
    chooseTvLounchValue = value;
    if (value != null) {
      log('selectedValue $chooseTvLounchValue');
    }
    update();
  }

  void chooseDrawingRoom2(String? value) {
    chooseDrawingRoom2Value = value;
    if (value != null) {
      log('selectedValue $chooseDrawingRoom2Value');
    }
    update();
  }

  List<String> DrawingRoom2 = [
    "None",
    "One",
  ];
  String? chooseDrawingRoom2Value;

  List<String> Kitchen2 = [
    "None",
    "One",
  ];
  String? chooseKitchen2Value;
  void chooseKitchen2(String? value) {
    chooseKitchen2Value = value;
    if (value != null) {
      log('selectedValue $chooseKitchen2Value');
    }
    update();
  }

  List<String> TvLounch2 = [
    "None",
    "One",
  ];
  String? chooseTvLounch2Value;
  void chooseTvLounch2(String? value) {
    chooseTvLounch2Value = value;
    if (value != null) {
      log('selectedValue $chooseTvLounch2Value');
    }
    update();
  }

  List<String> GroundFloorKitchen = [
    "None",
    "One",
  ];
  String? chooseGroundFloorKitchenValue;
  void chooseGroundFloorKitchen(String? value) {
    chooseGroundFloorKitchenValue = value;
    if (value != null) {
      log('selectedValue $chooseGroundFloorKitchenValue');
    }
    update();
  }

  List<String> GroundFloorDrawingRoom = [
    "None",
    "One",
  ];
  String? chooseGroundFloorDrawingRoomValue;
  void chooseGroundFloorDrawingRoom(String? value) {
    chooseGroundFloorDrawingRoomValue = value;
    if (value != null) {
      log('selectedValue $chooseGroundFloorDrawingRoomValue');
    }
    update();
  }

  List<String> GroundFloorTvLounch = [
    "None",
    "One",
  ];
  String? chooseGroundFloorTvLounchValue;
  void chooseGroundFloorTvLounch(String? value) {
    chooseGroundFloorTvLounchValue = value;
    if (value != null) {
      log('selectedValue $chooseGroundFloorTvLounchValue');
    }
    update();
  }

  /// groundFloor controller
  TextEditingController groundFloorTotalRoom = TextEditingController();
  TextEditingController groundFloorWashroomController = TextEditingController();

  /// firstFloor controller
  TextEditingController firstFloorTotalRoom = TextEditingController();
  TextEditingController firstFloorWashroomController = TextEditingController();

  /// secondFloor controller
  TextEditingController secondFloorRoomController = TextEditingController();
  TextEditingController secondFloorWashroomController = TextEditingController();

  int estimatedBricks = 0;
  int estimatedSand = 0;
  int estimatedGravel = 0;
  int estimatedIronRod = 0;
  int estimatedCement = 0;
  Future calculateEstimation() async {
    if (chooseAreaValue != null) {
      String intValue = chooseAreaValue!.split('')[0];
      int selectedValue = int.tryParse(intValue) ?? 0;
      double conversionFactor = 1.0;
      if (chooseAreaValue!.contains("Kanal")) {
        // Convert Kanal to Marla
        conversionFactor = 20.0;
      }
      double areaInMarla = selectedValue * conversionFactor;
      if(chooseFloorValue == 'Ground Floor'){
        int groundRoom = int.parse(groundFloorTotalRoom.text) ?? 0;
        int groundWashroom = int.parse(groundFloorWashroomController.text) ?? 0;
        int kitchenValue = chooseGroundFloorKitchenValue  == 'One'?  2 : 1;
        int drawingRoomValue = chooseGroundFloorDrawingRoomValue  == 'One'?  2 : 1;
        int tvLounchValue = chooseGroundFloorTvLounchValue  == 'One'?  2 : 1;

        // Calculate estimation for first floor
        estimatedBricks = (areaInMarla  * (groundRoom + groundWashroom + kitchenValue +drawingRoomValue +tvLounchValue) *  1000).toInt();
        estimatedSand = (areaInMarla  * (groundRoom + groundWashroom + kitchenValue +drawingRoomValue +tvLounchValue) * 10).toInt();
        estimatedGravel = (areaInMarla  * (groundRoom + groundWashroom + kitchenValue +drawingRoomValue +tvLounchValue)* 20).toInt();
        estimatedIronRod = (areaInMarla  * (groundRoom + groundWashroom + kitchenValue +drawingRoomValue +tvLounchValue) * 25).toInt();
        estimatedCement = (areaInMarla  * (groundRoom + groundWashroom + kitchenValue +drawingRoomValue +tvLounchValue) * 10).toInt();

      }
      else if (chooseFloorValue == '1') {
        int groundRoom = int.parse(groundFloorTotalRoom.text) ?? 0;
        int groundWashroom = int.parse(groundFloorWashroomController.text) ?? 0;
        int totalRooms = int.tryParse(firstFloorTotalRoom.text) ?? 0;
        int totalWashroom = int.tryParse(firstFloorWashroomController.text) ?? 0;

        /// ground floor value
        int kitchenValue1 = chooseGroundFloorKitchenValue  == 'One'?  2 : 1;
        int drawingRoomValue1 = chooseGroundFloorDrawingRoomValue  == 'One'?  2 : 1;
        int tvLounchValue1 = chooseGroundFloorTvLounchValue  == 'One'?  2 : 1;

        /// first floor value
        int firstFloorKitchenValue = chooseKitchenValue  == 'One'?  2 : 1;
        int firstFloorDrawingRoomValue = chooseDrawingRoomValue  == 'One'?  2 : 1;
        int firstFloorTvLounchValue = chooseTvLounchValue  == 'One'?  2 : 1;



        // Calculate estimation for first floor
        estimatedBricks = (areaInMarla * (totalRooms + groundRoom + groundWashroom + totalWashroom + kitchenValue1 +drawingRoomValue1 +tvLounchValue1 +firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue ) * 1000).toInt();
        estimatedSand = (areaInMarla * (totalRooms + groundRoom + groundWashroom + totalWashroom + kitchenValue1 +drawingRoomValue1 +tvLounchValue1+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue) * 10).toInt();
        estimatedGravel = (areaInMarla * (totalRooms + groundRoom + groundWashroom + totalWashroom + kitchenValue1 +drawingRoomValue1 +tvLounchValue1+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue) * 20).toInt();
        estimatedIronRod = (areaInMarla * (totalRooms + groundRoom + groundWashroom + totalWashroom + kitchenValue1 +drawingRoomValue1 +tvLounchValue1+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue) * 25).toInt();
        estimatedCement = (areaInMarla * (totalRooms + groundRoom + groundWashroom + totalWashroom + kitchenValue1 +drawingRoomValue1 +tvLounchValue1+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue) * 10).toInt();
      }
      else if (chooseFloorValue == '2') {
        int groundRoom = int.parse(groundFloorTotalRoom.text) ?? 0;
        int groundWashroom = int.parse(groundFloorWashroomController.text) ?? 0;
        int firstFloorTotalRooms = int.tryParse(firstFloorTotalRoom.text) ?? 0;
        int secondFloorTotalRooms = int.tryParse(secondFloorRoomController.text) ?? 0;
        int firstFloorWashroom = int.tryParse(firstFloorWashroomController.text) ?? 0;
        int secondFloorWashroom = int.tryParse(secondFloorWashroomController.text) ?? 0;
        /// ground floor values
        int kitchenValue2 = chooseGroundFloorKitchenValue  == 'One'?  2 : 1;
        int drawingRoomValue2 = chooseGroundFloorDrawingRoomValue  == 'One'?  2 : 1;
        int tvLounchValue2 = chooseGroundFloorTvLounchValue  == 'One'?  2 : 1;

        /// first floor values
        int firstFloorKitchenValue = chooseKitchenValue  == 'One'?  2 : 1;
        int firstFloorDrawingRoomValue = chooseDrawingRoomValue  == 'One'?  2 : 1;
        int firstFloorTvLounchValue = chooseTvLounchValue  == 'One'?  2 : 1;
        /// second floor values
        int firstFloorKitchenValue2 = chooseKitchen2Value  == 'One'?  2 : 1;
        int firstFloorDrawingRoomValue2 = chooseDrawingRoom2Value  == 'One'?  2 : 1;
        int firstFloorTvLounchValue2 = chooseTvLounch2Value  == 'One'?  2 : 1;

        // Calculate estimation for second floor
        estimatedBricks = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorWashroom + secondFloorWashroom + groundRoom + groundWashroom + kitchenValue2 +drawingRoomValue2 +tvLounchValue2 +firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue+firstFloorKitchenValue2 + firstFloorDrawingRoomValue2+firstFloorTvLounchValue2) * 1000).toInt();
        estimatedSand = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorWashroom + secondFloorWashroom + groundRoom + groundWashroom + kitchenValue2 +drawingRoomValue2 +tvLounchValue2+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue+firstFloorKitchenValue2 + firstFloorDrawingRoomValue2+firstFloorTvLounchValue2) * 10).toInt();
        estimatedGravel = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorWashroom + secondFloorWashroom + groundRoom + groundWashroom + kitchenValue2 +drawingRoomValue2 +tvLounchValue2+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue+firstFloorKitchenValue2 + firstFloorDrawingRoomValue2+firstFloorTvLounchValue2) * 20).toInt();
        estimatedIronRod = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorWashroom + secondFloorWashroom + groundRoom + groundWashroom + kitchenValue2 +drawingRoomValue2 +tvLounchValue2+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue+firstFloorKitchenValue2 + firstFloorDrawingRoomValue2+firstFloorTvLounchValue2) * 25).toInt();
        estimatedCement = (areaInMarla * (firstFloorTotalRooms + secondFloorTotalRooms + firstFloorWashroom + secondFloorWashroom + groundRoom + groundWashroom + kitchenValue2 +drawingRoomValue2 +tvLounchValue2+firstFloorKitchenValue + firstFloorDrawingRoomValue + firstFloorTvLounchValue+firstFloorKitchenValue2 + firstFloorDrawingRoomValue2+firstFloorTvLounchValue2) * 10).toInt();
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
    groundFloorTotalRoom.clear();
    firstFloorTotalRoom.clear();
    firstFloorTotalRoom.clear();
    firstFloorWashroomController.clear();
    secondFloorRoomController.clear();
    firstFloorWashroomController.clear();
    secondFloorWashroomController.clear();
    chooseFloorValue = null;
    chooseAreaValue = null;
    chooseKitchenValue = null;
    chooseDrawingRoomValue = null;
    chooseTvLounchValue = null;
    chooseKitchen2Value = null;
    chooseDrawingRoom2Value = null;
    chooseTvLounch2Value = null;
  }
}
