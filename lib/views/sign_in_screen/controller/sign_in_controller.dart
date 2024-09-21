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
}
