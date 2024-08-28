import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/product_controller.dart';
import 'package:my_app/screen/detail_screen.dart';
import 'package:my_app/widget/support_widget.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "PC CENTRAL",
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Welcome to Shop",
                        style: AppWidget.lightTextFeildStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const SizedBox(height: 5.0),
              GetBuilder<ProductController>(
                builder: (controller) {
                  final products = controller.DataRes?.products;
                  if (products?.first.image == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (products == null || products.isEmpty) {
                    return Center(
                      child: Text('No products found'),
                    );
                  }

                  return Container(
                    height: 190,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.network(
                                "http://192.168.100.39:8000/products/${item.image ?? 'placeholder.png'}",
                                height: 110,
                                width: 100,
                                fit: BoxFit.cover,
                                scale: 1.0,
                              ),
                              Text(
                                item.productName ?? 'Unknown Product',
                                style: AppWidget.semiboldTextFeildStyle(),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: const Icon(
                                      Icons.payment,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
