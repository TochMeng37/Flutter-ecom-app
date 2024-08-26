import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/screen/main_screen.dart';
import 'package:my_app/screen/product_controller.dart';
import 'package:my_app/screen/profile_screen.dart';

class HomeController extends GetxController {
  final box = GetStorage();

  int currentIndex = 0;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticate();
    });
    super.onInit();
  }

  void _authenticate() {
    final token = box.read<String?>("access_token");
    if (token == null) {
      Get.offAllNamed('/login');
    }
  }

  List<Widget> listScreen = [MainScreen(), ProductScreen(), ProfileScreen()];
  void chengIndex(int index) {
    currentIndex = index;
    update();
  }
}
