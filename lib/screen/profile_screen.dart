import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_app/constant/constant.dart';
import 'package:my_app/controllers/home_controller.dart';
import 'package:my_app/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileController>(builder: (context) {
        return Column(
          children: [
            Center(
              child: SizedBox(
                width: 100, // Set the width to your desired size
                height: 100, // Set the height to your desired size
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://10.0.2.2:8000/profile/${controller.users.profileUrl}"),
                  onBackgroundImageError: (exception, stackTrace) {
                    // Handle the error and provide a fallback image
                  },
                  // Fallback icon or widget
                ),
              ),
            ),
            Text(
              controller.users.name?.isNotEmpty == true
                  ? controller.users.name!
                  : 'Guest',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text("Profile"),
            ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: Text("logout"),
            ),
          ],
        );
      }),
    );
  }
}
