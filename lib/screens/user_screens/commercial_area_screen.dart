import 'package:amenities_app/controller/estimation_controller.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import 'estimation_result_screen.dart';


class CommercialAreaScreen extends StatelessWidget {
  const CommercialAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstimationController>(
      init: EstimationController(),
      builder: (c) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          

          appBar: AppBar(
            title: const Text(
              'Choose Commercial Area',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: c.residentialAreaFormKey,
              child: SingleChildScrollView(
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
                          const Divider(),
                          15.0.height,
                          Text('Enter First Floor Detail', style: kHeadingText.copyWith(fontSize: 12.0),),
                          20.0.height,
                          customTextFieldForEstimation(
                            hintText: 'Numbers of Room',
                            controller: c.firstFloorTotalRoom,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter First Floor Room';
                              }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! > 3){
                                return 'Enter Maximum 3 Room';
                              }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! < 3){
                                return 'Enter Minimum 3 Room';
                              }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! > 5){
                                return 'Enter Maximum 5 Room';
                              }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! < 3){
                                return 'Enter Minimum 3 Room';
                              }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! > 5){
                                return 'Enter Maximum 5 Room';
                              }
                              return null;
                            },
                          ),
                          20.0.height,
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
                              hint: const Text("Numbers of Kitchen"),
                              items: c.Kitchen.map((chooseKitchValue){
                                return DropdownMenuItem(
                                  value: chooseKitchValue.toString(),
                                  child: Text(chooseKitchValue.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseKitchValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                          20.0.height,
                          customTextFieldForEstimation(
                            hintText: 'Numbers of Washroom',
                            controller: c.firstFloorWashroomController,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter First Floor Total Washroom';
                              }
                              return null;
                            },
                          ),   20.0.height,
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
                              hint: const Text("Drawing Room"),
                              items: c.DrawingRoom.map((drawingValues){
                                return DropdownMenuItem(
                                  value: drawingValues.toString(),
                                  child: Text(drawingValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseDrawingRoomValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                          20.0.height,
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
                              hint: const Text("Tv Lounch"),
                              items: c.TvLounch.map((TvLounchValues){
                                return DropdownMenuItem(
                                  value: TvLounchValues.toString(),
                                  child: Text(TvLounchValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseTvLounchValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                        ],
                      ),

                    if(c.chooseFloorValue == 2)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.0.height,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              15.0.height,
                              Text('Enter First Floor Detail', style: kHeadingText.copyWith(fontSize: 12.0),),
                              20.0.height,
                              customTextFieldForEstimation(
                                hintText: 'Numbers of Room',
                                controller: c.firstFloorTotalRoom,
                                keyboardType: TextInputType.number,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please Enter First Floor Room';
                                  }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! < 2){
                                    return 'Enter Minimum 2 Room';
                                  }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! > 3){
                                    return 'Enter Maximum 3 Room';
                                  }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! < 2){
                                    return 'Enter Minimum 2 Room';
                                  }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! > 4){
                                    return 'Enter Maximum 4 Room';
                                  }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! < 2){
                                    return 'Enter Minimum 2 Room';
                                  }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! > 4){
                                    return 'Enter Maximum 4 Room';
                                  }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! < 2){
                                    return 'Enter Minimum 2 Room';
                                  }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! > 4){
                                    return 'Enter Maximum 4 Room';
                                  }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! < 3){
                                    return 'Enter Minimum 3 Room';
                                  }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! > 5){
                                    return 'Enter Maximum 5 Room';
                                  }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! < 3){
                                    return 'Enter Minimum 3 Room';
                                  }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! > 5){
                                    return 'Enter Maximum 5 Room';
                                  }
                                  return null;
                                },
                              ),
                              20.0.height,
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
                                  hint: const Text("Numbers of Kitchen"),
                                  items: c.Kitchen.map((chooseKitchValue){
                                    return DropdownMenuItem(
                                      value: chooseKitchValue.toString(),
                                      child: Text(chooseKitchValue.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                    );
                                  }).toList(),
                                  value: c.chooseKitchValue,
                                  onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                              20.0.height,
                              customTextFieldForEstimation(
                                hintText: 'Numbers of Washroom',
                                controller: c.firstFloorWashroomController,
                                keyboardType: TextInputType.number,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Please Enter First Floor Total Washroom';
                                  }
                                  return null;
                                },
                              ),   20.0.height,
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
                                  hint: const Text("Drawing Room"),
                                  items: c.DrawingRoom.map((drawingValues){
                                    return DropdownMenuItem(
                                      value: drawingValues.toString(),
                                      child: Text(drawingValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                    );
                                  }).toList(),
                                  value: c.chooseDrawingRoomValue,
                                  onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                              20.0.height,
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
                                  hint: const Text("Tv Lounch"),
                                  items: c.TvLounch.map((TvLounchValues){
                                    return DropdownMenuItem(
                                      value: TvLounchValues.toString(),
                                      child: Text(TvLounchValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                    );
                                  }).toList(),
                                  value: c.chooseTvLounchValue,
                                  onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                            ],
                          ),

                          /// second floor details
                          const Divider(),
                          15.0.height,
                          Text('Enter Second Floor Detail', style: kHeadingText.copyWith(fontSize: 12.0),),
                          20.0.height,
                          customTextFieldForEstimation(
                            hintText: 'Numbers of Room',
                            controller: c.secondFloorRoomController,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter Second Floor Room';
                              }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '3 Marla' && int.tryParse(value)! > 3){
                                return 'Enter Maximum 3 Room';
                              }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '5 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '7 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! < 2){
                                return 'Enter Minimum 2 Room';
                              }else if(c.chooseAreaValue == '10 Marla'  && int.tryParse(value)! > 4){
                                return 'Enter Maximum 4 Room';
                              }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! < 3){
                                return 'Enter Minimum 3 Room';
                              }else if(c.chooseAreaValue == '1 Kanal'  && int.tryParse(value)! > 5){
                                return 'Enter Maximum 5 Room';
                              }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! < 3){
                                return 'Enter Minimum 3 Room';
                              }else if(c.chooseAreaValue == '2 Kanal'  && int.tryParse(value)! > 5){
                                return 'Enter Maximum 5 Room';
                              }
                              return null;
                            },
                          ),
                          20.0.height,
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
                              hint: const Text("Numbers of Kitchen"),
                              items: c.Kitchen.map((chooseKitchValue){
                                return DropdownMenuItem(
                                  value: chooseKitchValue.toString(),
                                  child: Text(chooseKitchValue.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseKitchValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                          20.0.height,
                          customTextFieldForEstimation(
                            hintText: 'Numbers of Washroom',
                            controller: c.secondFloorWashroomController,
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'Please Enter second Floor Total Washroom';
                              }
                              return null;
                            },
                          ),
                          20.0.height,
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
                              hint: const Text("Drawing Room"),
                              items: c.DrawingRoom.map((drawingValues){
                                return DropdownMenuItem(
                                  value: drawingValues.toString(),
                                  child: Text(drawingValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseDrawingRoomValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                          20.0.height,
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
                              hint: const Text("Tv Lounch"),
                              items: c.TvLounch.map((TvLounchValues){
                                return DropdownMenuItem(
                                  value: TvLounchValues.toString(),
                                  child: Text(TvLounchValues.toString(), style:kPrimaryText.copyWith(fontSize: 14.0),),
                                );
                              }).toList(),
                              value: c.chooseTvLounchValue,
                              onChanged: (newValue)=> c.chooseDrawingRoom(newValue.toString())),
                        ],
                      ),
                    40.0.height,
                  ],
                ),
              ),
            ),
          ),

          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: primarybutton(btnText: 'Get Estimate',press: (){
              if(!c.residentialAreaFormKey.currentState!.validate()){
                return;
              }
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

