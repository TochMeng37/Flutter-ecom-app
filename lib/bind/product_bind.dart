import 'package:get/get.dart';
import 'package:my_app/controllers/product_controller.dart';

class ProductBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
