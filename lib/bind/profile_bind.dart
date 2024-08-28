import 'package:get/get.dart';
import 'package:my_app/controllers/profile_controller.dart';

class ProfileBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
