import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/utils/logger.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  var isLoading = false.obs;

  void anonymousLogin() async {
    isLoading(true);
    try {
      await FirebaseAuth.instance.signInAnonymously();
      logger.d("Signed in with temporary account.");
      Get.offAllNamed(Routes.HOME);
      Get.snackbar("Login Success", "Redirect to home page");
      logger.d("Unknown error.");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          Get.snackbar("Fail to login",
              "Anonymous auth hasn't been enabled for this project.");
          logger.d("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          Get.snackbar("Fail to login", "Unknown error.");
          logger.d("Unknown error.");
      }
    } finally {
      isLoading(false);
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.AUTH);
  }
}
