import 'package:flutter/material.dart';
import '../../constant.dart';
import 'estimate_raw_marerial_screen.dart';


class InputEstimateScreen extends StatefulWidget {


  const InputEstimateScreen({Key? key}) : super(key: key);

  @override
  State<InputEstimateScreen> createState() => _InputEstimateScreenState();
}

class _InputEstimateScreenState extends State<InputEstimateScreen> {
  String? valueChoose;
List<String> listItem = [
  "Single Story","Double story",
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Select Floor',
          style: kSubHeadingText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Numbers Of Room"),
            DropdownButtonFormField(
                items: listItem.map((valueItem){
              return DropdownMenuItem(value: valueItem,
              child: Text(valueItem),
              );
            }).toList(),
                value: valueChoose,
                onChanged: (newValue){
              setState(() {
                valueChoose = newValue.toString();
              });
                }),
            40.0.height,
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  decoration: InputDecoration(
                   label:  Text("Number of Floor",),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),

            // Text("Numbers Of Room"),
            40.0.height,
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Numbers of Room",),
                    // hintText: "Numbers",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),

            // Text("Numbers Of Room"),
            40.0.height,
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Room Dimention"),
                    // hintText: "Numbers",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
            40.0.height,
            Center(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EstimateRawMaterialScreen()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.teal),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        "Estimation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
