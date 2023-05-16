import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'building_type_screen.dart';
import 'constant.dart';

class InterestAreaScreen extends StatelessWidget {
  const InterestAreaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Choose your Building Type'),
        leading: Icon(Icons.menu,color: kWhiteColor,),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.shopping_cart_outlined),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
        child: Column(
          children: [
            Container(height: 50,
            width: double.infinity,
            child: Center(child: Text("Get Prodect")),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            BuildingTypeScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    child: Image.asset("Assets/Images/undraw_Quiet_town.png",fit: BoxFit.cover,),
                    decoration: BoxDecoration(color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),),
                ),
              ),
            ),
            10.0.height,
            Container(height: 50,
              width: double.infinity,
              child: Center(child: Text("Get Estimation")),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Image.asset("Assets/Images/Estimate_house.png",fit: BoxFit.cover,),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)
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
