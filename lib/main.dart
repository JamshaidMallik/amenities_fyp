import 'package:amenities_app/accounts_screen/log_in_screen.dart';
import 'package:amenities_app/building_type_screen.dart';
import 'package:amenities_app/interest_area_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.teal
        )
      ),
      home: InterestAreaScreen(),
      // home: BuildingTypeScreen(),
      // home: LogInScreen(),
    );
  }
}


