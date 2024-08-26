import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/screen/home_screen.dart';
import 'package:my_app/services/api_helper.dart'; // Ensure this import exists

class UserLogins {
  final _apiHelper = APIHelper();
  final box = GetStorage();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _apiHelper.loginUsers(
        email: email,
        password: password,
      );
      print("user ${jsonEncode(res)}");
      setToken(res.accessToken!);
      Get.offAllNamed("/home");
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials");
      } else {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
