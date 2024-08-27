import 'package:get/get.dart';
import 'package:my_app/controllers/home_controller.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
