import 'package:dreamtales/views/signup_page.dart';
import 'package:dreamtales/views/reset_password_page.dart'; // Import the ResetPasswordPage
import 'package:dreamtales/widgets/auth_appbard.dart';
import 'package:dreamtales/widgets/my_button.dart';
import 'package:dreamtales/widgets/outline_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController =
      Get.put<AuthController>(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthAppBar(text: "Welcome Back"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              children: [
                OutlineTextfield(
                  controller: emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                OutlineTextfield(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return MyButton(
                    isLoading: authController.isLoading.value,
                    onTap: () async {
                      await authController.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    text: "Login",
                  );
                }),
                TextButton(
                  onPressed: () {
                    Get.off(() => SignupPage());
                  },
                  child: const Text("Don't have an account? Sign Up here"),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() =>
                        ResetPasswordPage()); // Navigate to Reset Password Page
                  },
                  child: const Text("Forgot your password? Reset here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
