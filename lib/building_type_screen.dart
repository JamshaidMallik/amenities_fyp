import 'package:amenities_app/area_screen.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class BuildingTypeScreen extends StatelessWidget {
  const BuildingTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [Icon(Icons.menu,color: ktealColor,size: 30,),
            //     Icon(Icons.shopping_cart_outlined,color: ktealColor,size: 30,),
            //   ],
            // ),
            30.0.height,
            Center(child: Text('Choose your Building Type'),),
            30.0.height,

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AreaScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    child: Icon(Icons.home_outlined,size: 140,color: kTealColor,),
                   decoration: BoxDecoration(color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(20)),),
                ),
              ),
            ),
            10.0.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Icon(Icons.castle_outlined,size: 140,color: kTealColor,),
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
