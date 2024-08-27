import 'package:get/get.dart';
import 'package:my_app/controllers/login_controller.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserLogins());
  }
}
