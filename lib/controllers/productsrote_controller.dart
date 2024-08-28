import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/model/order_model.dart';
import 'package:my_app/services/api_helper.dart';

class ProductsroteController extends GetxController {
  final APIHelper api = APIHelper();
  final GetStorage box = GetStorage();
  DataResBuy DataRes = DataResBuy();

  @override
  void onInit() {
    getBuys();
    super.onInit();
  }

  void getBuys() async {
    try {
      final token = box.read("access_token");
      final response = await api.getBuy(token: token);
      DataRes = response;
      update();
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
  }
}
