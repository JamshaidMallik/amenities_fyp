import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../controller/estimation_controller.dart';
import '../../widgets/button_widgets.dart';
import '../../widgets/custom_text_field.dart';
import 'estimation_result_screen.dart';


class ResidentialAreaScreen extends StatelessWidget {
  const ResidentialAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimationController>(
        init: EstimationController(),
        builder: (c) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text(
                'Choose Residential Area',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.0.height,
                  Text('Please Choose Your Correct Area', style: kHeadingText.copyWith(fontSize: 12.0),),
                  10.0.height,
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                      hint: const Text("Select Area"),
                      items: c.areaList.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem, style:kPrimaryText.copyWith(fontSize: 14.0),),
                        );
                      }).toList(),
                      value: c.chooseAreaValue,
                      onChanged: (newValue)=> c.chooseArea(newValue)),
                  20.0.height,
                  Text('Please Choose Your Numbers Of Floor', style: kHeadingText.copyWith(fontSize: 12.0),),
                  10.0.height,
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: kPrimaryColor),
                        ),
                      ),
                      hint: const Text("Select Floor"),
                      items: c.floorList.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                        );
                      }).toList(),
                      value: c.chooseFloorValue,
                      onChanged: (newValue)=> c.chooseFloor(newValue)),

                  if(c.chooseFloorValue ==  1)
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.0.height,
                      Text('Enter First Floor Total Room', style: kHeadingText.copyWith(fontSize: 12.0),),
                      10.0.height,
                      customTextField(hintText: 'Numbers of Room', controller: c.firstFloorTotalRoom, keyboardType: TextInputType.number),
                    ],
                  ),
                  if(c.chooseFloorValue == 2)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        15.0.height,
                        Text('Enter First Floor Total Room', style: kHeadingText.copyWith(fontSize: 12.0),),
                        10.0.height,
                        customTextField(hintText: 'Numbers of Room', controller: c.firstFloorTotalRoom, keyboardType: TextInputType.number),
                        15.0.height,
                        Text('Enter Second Floor Total Room', style: kHeadingText.copyWith(fontSize: 12.0),),
                        10.0.height,
                        customTextField(hintText: 'Numbers of Room', controller: c.secondFloorRoomController, keyboardType: TextInputType.number),
                      ],
                    ),

                  40.0.height,
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: primarybutton(btnText: 'Get Estimate',press: (){
                if(c.chooseAreaValue == null){
                  Get.snackbar(
                    colorText: Colors.white,
                      'Alert!', 'Please Select Area');
                  return;
                }else if(c.chooseFloorValue == null){
                  Get.snackbar(
                      colorText: Colors.white,
                      'Alert!', 'Please Select Floor');
                  return;
                } else if(c.firstFloorTotalRoom.text.isEmpty){
                  Get.snackbar(
                      colorText: Colors.white,
                      'Alert!', 'Please Enter First Floor Total Room');
                } else if(c.chooseFloorValue == 2 && c.secondFloorRoomController.text.isEmpty){
                  Get.snackbar(
                      colorText: Colors.white,
                      'Alert!', 'Please Enter Second Floor Total Room');
                } else{
                  c.calculateEstimation();
                  Get.to(()=> const EstimateResultScreen());
                }

              }),
            ),
          );
        }
    );
  }
}
