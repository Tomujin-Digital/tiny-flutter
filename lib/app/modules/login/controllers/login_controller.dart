import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkForm() {
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      formKey.currentState?.save();
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }
}
