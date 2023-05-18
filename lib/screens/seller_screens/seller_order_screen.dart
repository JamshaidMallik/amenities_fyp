import 'package:amenities_app/constant.dart';
import 'package:flutter/material.dart';

class SellerOrderScreen extends StatelessWidget {
  const SellerOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Replace Your Order",style: kSecondaryWhiteText,),
                  subtitle: Text("Pending",style: TextStyle(color: kRedColor),),
                ),
              ),
            ),
            10.0.height,
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Replace Your Order",style: kSecondaryWhiteText,),
                  subtitle: Text("Complete",style: kPrimaryText,),
                ),
              ),
            ),
            10.0.height,
            Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://i.pinimg.com/564x/ee/55/08/ee5508020993c264524edce53aeb3636.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Replace Your Order",style: kSecondaryWhiteText),
                  subtitle: Text("Pending",style: TextStyle(color: kRedColor)),
                ),
              ),
            ),
            10.0.height,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Center(
                child: ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://i.pinimg.com/564x/c3/6b/f5/c36bf56ef27f06b96964bd7d93da635f.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text("Replace Your Order",style: kSecondaryWhiteText,),
                  subtitle: Text("Complete",style: kPrimaryText,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
