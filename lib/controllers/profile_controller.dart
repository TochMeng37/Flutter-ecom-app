import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/model/user_models.dart';
import 'package:my_app/services/api_helper.dart';

class ProfileController extends GetxController {
  final _apiHelper = APIHelper();
  final box = GetStorage();
  UserModel users = UserModel();

  @override
  void onInit() {
    getAccountUsers();
    super.onInit();
  }

  void getAccountUsers() async {
    try {
      final tokens = box.read("access_token");
      final response = await _apiHelper.getUserAccount(token: tokens);
      users = response;
      update();
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials. Please log in again.");
      }
      update();
    }
  }

  void logout() async {
    try {
      final getToken = box.read("access_token");
      final message = await _apiHelper.logout(token: getToken);
      box.remove("access_token");
      Get.snackbar("Message", message);
      Get.offAllNamed('/login');
    } catch (e) {
      if (e.toString().contains('401')) {
        Get.snackbar("Error", "Invalid credentials. Please log in again.");
      } else {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void setToken(String token) async {
    await box.write("access_token", token);
  }
}
