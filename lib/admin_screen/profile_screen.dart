import 'package:amenities_app/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 60),
        child: Column(

          children: [
            Center(
              child: CircleAvatar(
                maxRadius: 50,
                child: Image.network(
                    "https://i.pinimg.com/236x/a1/e3/54/a1e354e74959e999b5fcbb95d1815bbd.jpg"),
              ),
            ),
            Text("example.com"),
            20.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Name",
                      border: InputBorder.none),
                ),
              ),
            ),
            10.0.height,
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "Email", border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
