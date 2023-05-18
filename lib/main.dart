import 'package:amenities_app/screens/auth_screens/log_in_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetStorage.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.teal
        )
      ),
      home: SellerMainScreen(),
      // home: SliderScreen(),
      // home: LogInScreen(),
      // home: BuildingTypeScreen(),
      // home: LogInScreen(),
    );
  }
}


