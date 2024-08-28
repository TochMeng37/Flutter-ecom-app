import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/profile_controller.dart';
import 'package:my_app/widget/support_widget.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<ProfileController>(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
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
                          "Hey, ${controller.users.name.toString()}",
                          style: AppWidget.boldTextFeildStyle(),
                        ),
                        Text(
                          "Welcome to PC Central",
                          style: AppWidget.lightTextFeildStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        "http://192.168.100.39:8000/profile/${controller.users.profileUrl}",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 180,
                  child: Text(
                    "Name : " + controller.users.name.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 500,
                  child: Text(
                    "Email: " + controller.users.email.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.logout();
                      },
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            controller.logout();
                          },
                          child: const Text(
                            "Log Out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
