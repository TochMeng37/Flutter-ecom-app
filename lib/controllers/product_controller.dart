import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/model/product_model.dart';
import 'package:my_app/services/api_helper.dart';

class ProductController extends GetxController {
  final APIHelper api = APIHelper();
  final GetStorage box = GetStorage();
  ProductResponse pro = ProductResponse(data: []); // Initialize with empty data

  bool isLoading = true;
  // Ensure non-null data

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    isLoading = true;
    update();
    try {
      final token = box.read("access_token");
      final response = await api.getallProducts(token: token);
      pro = response;
      print("${jsonEncode(pro)}");
    } catch (e) {
      Get.snackbar("Get Data", e.toString());
    } finally {
      isLoading = false;
      update(); // Notify listeners that the state has changed
    }
  }
}
