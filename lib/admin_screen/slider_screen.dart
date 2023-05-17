import 'package:amenities_app/admin_screen/profile_screen.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('flutter.com'),
              accountEmail: Text("example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/236x/a1/e3/54/a1e354e74959e999b5fcbb95d1815bbd.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Amenities", style: kSubHeadingText),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Home"),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_people_sharp),
              title: Text("Orders"),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text("Help & Sport"),
              onTap: () => null,
            ),
            ListTile(
              leading: Icon(Icons.data_usage_sharp),
              title: Text("About us"),
              onTap: () => null,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Get Estimation",
                  style: kSecondaryText,
                )),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text("Users",)),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:kGreyColor),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(child: Text("Products",)),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kGreyColor),
                    ),
                  ],
                ),
              ),

            ],
          ),
          10.0.height,
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Center(child: Text("Orders",)),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Complain",)),
                      ),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),

                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
