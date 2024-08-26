import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return IndexedStack(
          index: controller.currentIndex,
          children: controller.listScreen,
        );
      }),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: (index) {
            controller.chengIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              activeIcon: Icon(Icons.search, color: Colors.blue),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              activeIcon: Icon(Icons.search, color: Colors.blue),
              label: 'Profile',
            ),
          ],
        );
      }),
    );
  }
}
