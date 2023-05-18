import 'package:amenities_app/screens/user_screens/area_screen.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class BuildingTypeScreen extends StatelessWidget {
  const BuildingTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: kWhiteColor,),
        actions: const [
          Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.shopping_cart_outlined),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 15,right: 15),
        child: Column(
          children: [
            30.0.height,
            const Center(child: Text('Choose your Building Type'),),
            30.0.height,

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const AreaScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                   decoration: BoxDecoration(color: Colors.grey.shade200,
                   borderRadius: BorderRadius.circular(20)),
                    child: const Icon(Icons.home_outlined,size: 140,color: kTealColor,),),
                ),
              ),
            ),
            10.0.height,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Icon(Icons.castle_outlined,size: 140,color: kTealColor,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
