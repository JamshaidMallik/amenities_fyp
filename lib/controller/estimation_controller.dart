import 'package:get/get.dart';

class EstimationController extends GetxController{
  String? valueChoose;
  List<String> listItem = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "Custom"
  ];

  void chooseValue(String? value){
    valueChoose = value;
    update();
  }

}