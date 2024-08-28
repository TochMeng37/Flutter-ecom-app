import 'package:get/get.dart';
import 'package:my_app/services/api_helper.dart';

class RegisterController extends GetxController {
  final APIHelper _apiHelper = APIHelper();

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiHelper.registerUser(
        name: name,
        email: email,
        password: password,
      );
      Get.snackbar("Message", response);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
