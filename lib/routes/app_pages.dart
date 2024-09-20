import 'package:dreamtales/bindings/auth_binding.dart';
import 'package:get/get.dart';
import '../views/login_page.dart';
import '../views/signup_page.dart';
import '../views/auth_wrapper.dart'; // Add this
import '../views/home_page.dart'; // Add this

class AppPages {
  static final routes = [
    GetPage(
        name: '/',
        page: () => AuthWrapper(),
        binding: AuthBinding()), // Default route is the AuthWrapper
    GetPage(name: '/login', page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: '/signup', page: () => SignupPage(), binding: AuthBinding()),
    GetPage(
        name: '/home',
        page: () => HomePage(),
        binding: AuthBinding()), // Add HomePage route
  ];
}
