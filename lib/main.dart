import 'package:dreamtales/bindings/auth_binding.dart';
import 'package:dreamtales/firebase_options.dart';
import 'package:dreamtales/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.brown,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      getPages: AppPages.routes,
      initialBinding:
          AuthBinding(), // Ensures AuthController is loaded at the start
    );
  }
}
