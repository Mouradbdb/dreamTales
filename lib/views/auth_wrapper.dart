import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'login_page.dart';
import 'home_page.dart';  // You'll need to create this page

class AuthWrapper extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

   AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Check if the user is logged in
      if (authController.firebaseUser.value != null) {
        // If the user is logged in, navigate to the home page
        return  HomePage();
      } else {
        // If the user is not logged in, navigate to the login page
        return LoginPage();
      }
    });
  }
}
