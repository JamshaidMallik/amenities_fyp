import 'package:amenities_app/controller/estimation_controller.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant.dart';
import 'estimation_result_screen.dart';


class AreaScreen extends StatelessWidget {
  const AreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimationController>(
      init: EstimationController(),
      builder: (c) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              'Choose Area',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      if (valueItem == "Custom") {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      } else {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text('$valueItem Marla'),
                        );
                      }
                    }).toList(),
                    value: c.valueChoose,
                    onChanged: (newValue)=> c.chooseValue(newValue)),
                c.valueChoose == 'Custom'?  customTextField(hintText: 'Enter Custom Area',controller: c.customAreaController):Container(),
                10.0.height,
                customTextField(hintText: 'Numbers of Floor', controller: c.floorController),
                10.0.height,
                customTextField(hintText: 'Numbers of Room',controller: c.roomController),
                10.0.height,
                customTextField(hintText: 'Room Dimension', controller: c.roomDimensionController),
                40.0.height,
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: primarybutton(btnText: 'Get Estimate',press: (){
              Get.to(()=> const EstimateResultScreen());
            }),
          ),
        );
      }
    );
  }
}

