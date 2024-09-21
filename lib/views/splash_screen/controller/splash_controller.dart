import 'package:al_things/views/sign_in_screen/screen/sign_in_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void navigateToHome() {
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => SignInScreen());
    });
  }
}
