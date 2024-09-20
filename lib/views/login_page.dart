import 'package:dreamtales/views/signup_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(text: "Welcome Back"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Column(
              children: [
                OutlineTextfield(
                  controller: emailController,
                  labelText: 'Email',
                ),
                SizedBox(height: 20),
                OutlineTextfield(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                MyButton(
                  onTap: () async {
                    await authController.signIn(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  },
                  text: "Login",
                ),
                TextButton(
                  onPressed: () {
                    Get.off(() =>
                        SignupPage()); // Navigate back to the login page or any previous page
                  },
                  child: Text("Don't have an account? SignUp here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
