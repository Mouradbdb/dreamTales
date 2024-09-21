import 'package:dreamtales/services/auth_sevices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Firebase user
  Rx<User?> firebaseUser = Rx<User?>(null);

  // Loading state
  RxBool isLoading = false.obs;

  // Inject FirebaseAuthService
  final FirebaseAuthService authService =
      Get.put<FirebaseAuthService>(FirebaseAuthService());

  @override
  void onInit() {
    firebaseUser.bindStream(authService.user); // Listen to user stream
    super.onInit();
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true; // Start loading
      await authService.signIn(email, password);
    } catch (e) {
      Get.snackbar("Error signing in", e.toString());
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true; // Start loading
      await authService.signUp(email, password);
    } catch (e) {
      Get.snackbar("Error signing up", e.toString());
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      isLoading.value = true; // Start loading
      await authService.signOut();
    } catch (e) {
      Get.snackbar("Error signing out", e.toString());
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
