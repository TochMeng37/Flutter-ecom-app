import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/product_controller.dart';
import 'package:my_app/screen/detail_screen.dart';
import 'package:my_app/widget/support_widget.dart';

class MainScreen extends StatelessWidget {
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: AppWidget.lightTextFeildStyle(),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Product",
                      style: AppWidget.semiboldTextFeildStyle()),
                  const Text(
                    "See all",
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              GetBuilder<ProductController>(
                builder: (controller) {
                  final data = controller.responses.data;
                  if (data?.first.image == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    height: 190,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data?.length,
                      itemBuilder: (context, index) {
                        final item = data?[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.network(
                                "http://192.168.100.39:8000/products/${item?.image}",
                                height: 110,
                                width: 100,
                                fit: BoxFit.cover,
                                scale: 1.0,
                              ),
                              Text(
                                "${item?.productName}",
                                style: AppWidget.semiboldTextFeildStyle(),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "${item?.price.toString() ?? '0'}",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      Get.to(() => ProductDetail());
                                      controller.getOne(
                                          productID: controller
                                              .responses.data![index].id
                                              .toString());
                                    },
                                  ),
                                  const SizedBox(
                                    width: 30.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular((7))),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  )
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
