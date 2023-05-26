import 'package:amenities_app/constant.dart';
import 'package:amenities_app/screens/auth_screens/log_in_screen.dart';
import 'package:amenities_app/screens/seller_screens/seller_main_screen.dart';
import 'package:amenities_app/screens/user_screens/user_main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/auth_controller.dart';
import 'firebase_options.dart';
import 'screens/admin_screen/admin_main_screen.dart';

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
    final userType = kStorage.read(kUserType);
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.teal
        ),

      ),
      home: StreamBuilder(
        stream: AuthController().auth.authStateChanges(),
        builder: (context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            if(userType == 'Admin'){
              return const AdminMainScreen();
            }else if(userType == 'Seller'){
              return const SellerMainScreen();
            }else if(userType == 'User'){
              return const UserMainScreen();
            }else{
              return LogInScreen();
            }
          }else{
            return LogInScreen();
          }
        },
      ),
    );
  }
}


