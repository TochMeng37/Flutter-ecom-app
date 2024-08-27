import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/product_controller.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [Text("jghdjfgh")],
          ),
        ));
  }
}
