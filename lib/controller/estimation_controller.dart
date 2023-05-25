import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController {
  TextEditingController customAreaController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController roomDimensionController = TextEditingController();

  String? valueChoose;
  List<String> listItem = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "Custom"
  ];
  void chooseValue(String? value) {
    valueChoose = value;
    update();
  }
}
