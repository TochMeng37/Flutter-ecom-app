// import 'package:final_mobile_pc_app/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/product_controller.dart';
import 'package:my_app/screen/product_controller.dart';

class ProductDetail extends StatelessWidget {
  final controller = Get.put(ProductController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef5f1),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.arrow_back_ios_new_outlined)),
              ),
              GetBuilder<ProductController>(builder: (context) {
                if (controller.prLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.network(
                      "http://192.168.100.39:8000/products/${controller.showBuyID.data!.image! ?? "placeholder.png"}",
                      height: 250,
                    ),
                  );
                }
              })
            ]),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<ProductController>(
                          builder: (context) {
                            return Text(
                              "${controller.showBuyID.data?.productName}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                        GetBuilder<ProductController>(
                          builder: (context) {
                            return Text(
                              "${controller.showBuyID.data?.price}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Details",
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    // style: AppWidget.semiboldTextFeildStyle(),
                    //),
                    SizedBox(
                      height: 20.0,
                    ),
                    GetBuilder<ProductController>(
                      builder: (context) {
                        return Text(
                            "${controller.showBuyID.data?.description}");
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          Get.to(() => ProductScreen());
                        },
                        child: Text(
                          "Order Now",
                          style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
