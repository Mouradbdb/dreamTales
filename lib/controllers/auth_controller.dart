import 'package:dreamtales/views/home_page.dart';
import 'package:dreamtales/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());

    super.onInit();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  // Sign In method
  Future<void> signIn(String email, String password) async {
    try {
      isLoading(true);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() =>  HomePage()); // Navigate to HomePage on success
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Sign Up method
  Future<void> signUp(String email, String password) async {
    try {
      isLoading(true);
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() =>  HomePage()); // Navigate to HomePage on success
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Sign Out method
  Future<void> signOut() async {
    try {
      isLoading(true);
      await _auth.signOut();
      Get.offAll(() => LoginPage()); // Navigate back to LoginPage
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Reset Password method
  Future<void> resetPassword(String email) async {
    try {
      isLoading(true);
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar(
          'Success', 'Password reset email sent! Please check your inbox.');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
