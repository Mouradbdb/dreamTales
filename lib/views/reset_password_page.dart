import 'package:dreamtales/widgets/auth_appbard.dart';
import 'package:dreamtales/widgets/my_button.dart';
import 'package:dreamtales/widgets/outline_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordPage extends StatelessWidget {
  final AuthController authController =
      Get.put<AuthController>(AuthController());
  final TextEditingController emailController = TextEditingController();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthAppBar(text: "Reset Password"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              children: [
                OutlineTextfield(
                  controller: emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return MyButton(
                    isLoading: authController.isLoading.value,
                    onTap: () async {
                      await authController
                          .resetPassword(emailController.text.trim());
                    },
                    text: "Send Reset Link",
                  );
                }),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.back(); // Navigate back to the previous page (Login Page)
                  },
                  child: const Text("Back to Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
