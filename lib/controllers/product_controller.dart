import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/model/detail_model.dart';
import 'package:my_app/model/order_model.dart';
import 'package:my_app/model/product_model.dart';
import 'package:my_app/services/api_helper.dart';

class ProductController extends GetxController {
  final APIHelper api = APIHelper();
  final GetStorage box = GetStorage(); // Initialize with empty data
  ProductResponse responses = ProductResponse();
  ShowBuyID showBuyID = ShowBuyID();
  DataResBuy DataRes = DataResBuy();
  bool isLoading = true;
  bool prLoading = true;

  @override
  void onInit() {
    getProduct();
    getBuys();
    super.onInit();
  }

  Future<void> getProduct() async {
    try {
      isLoading = true;
      final token = box.read("access_token");
      final response = await api.getallProducts(token: token);
      responses = response;
      update();
    } catch (e) {
      isLoading = true;
      Get.snackbar("Get Data", e.toString());
      update();
    } finally {
      isLoading = false;
      update(); // Notify listeners that the state has changed
    }
  }

  Future<void> getOne({required String productID}) async {
    try {
      final token = box.read("access_token");
      final response = await api.showOne(token: token, productID: productID);
      showBuyID = response;
      update();
      prLoading = false;
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    }
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
