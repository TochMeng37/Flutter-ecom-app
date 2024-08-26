import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package if using GetMaterialApp
import 'package:my_app/screen/home_screen.dart';
import 'package:my_app/screen/login_screen.dart';
import 'package:my_app/screen/register_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: "home",
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
      ],
    ),
  );
}
