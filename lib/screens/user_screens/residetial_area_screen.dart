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
                  Text('Please Choose Your Correct Area Or Type Custom', style: kHeadingText.copyWith(fontSize: 12.0),),
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
                      items: c.listItem.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem, style:kPrimaryText.copyWith(fontSize: 14.0),),
                        );
                      }).toList(),
                      value: c.valueChoose,
                      onChanged: (newValue)=> c.chooseArea(newValue)),
                  c.valueChoose == 'Custom'?  Column(
                    children: [
                      10.0.height,
                      customTextField(hintText: 'Enter Custom Area',controller: c.customAreaController),
                    ],
                  ):Container(),
                  20.0.height,
                  Text('Enter Total Room', style: kHeadingText.copyWith(fontSize: 12.0),),
                  10.0.height,
                  customTextField(hintText: 'Numbers of Room', controller: c.roomController, keyboardType: TextInputType.number),
                  30.0.height,
                  Text('Room Dimension in (Foot)', style: kHeadingText.copyWith(fontSize: 12.0),),
                  10.0.height,
                  Row(
                    children: [
                      Expanded(child: customTextField(hintText: 'Height',controller: c.roomHeightController,keyboardType: TextInputType.number)),
                      5.0.width,
                      Expanded(child: customTextField(hintText: 'Width',controller: c.roomWidthController,keyboardType: TextInputType.number)),
                      5.0.width,
                      Expanded(child: customTextField(hintText: 'Length',controller: c.roomLengthController,keyboardType: TextInputType.number)),
                    ],
                  ),

                  40.0.height,
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: primarybutton(btnText: 'Get Estimate',press: (){
                c.calculateEstimation();
                Get.to(()=> const EstimateResultScreen());
              }),
            ),
          );
        }
    );
  }
}
