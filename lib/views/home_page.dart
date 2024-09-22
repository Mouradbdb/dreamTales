import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Obx(() {
            return authController.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      await authController.signOut(); // Sign out user
                    },
                  );
          }),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
