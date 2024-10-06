import 'package:al_things/views/bottom_navigation/screen/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  void toggleCheckbox(bool? value) {
    isChecked = value ?? false; // Update checkbox state
    update();
  }

  void login() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Get.to(() => NavigationScreen());
      Get.snackbar('Success', 'Signing in ..');
    } else {
      Get.snackbar('Error', 'please enter username or password');
    }
  }
}
