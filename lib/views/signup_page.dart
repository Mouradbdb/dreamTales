import 'package:dreamtales/views/login_page.dart';
import 'package:dreamtales/widgets/auth_appbard.dart';
import 'package:dreamtales/widgets/my_button.dart';
import 'package:dreamtales/widgets/outline_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SignupPage extends StatelessWidget {
  final AuthController authController =
      Get.put<AuthController>(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(text: "Create An Account"),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
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
                OutlineTextfield(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Obx(() {
                  return MyButton(
                    isLoading: authController.isLoading.value,
                    onTap: () async {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        await authController.signUp(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      } else {
                        Get.snackbar("Error", "Passwords do not match");
                      }
                    },
                    text: "Sign Up",
                  );
                }),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.off(() => LoginPage());
                  },
                  child: Text("Already have an account? Login here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
