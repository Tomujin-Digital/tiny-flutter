import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../0_initial/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  // final authCtrl = Get.find<AuthController>();
  // final authController =
  //     Get.put<AuthController>(AuthController(), permanent: true);
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isVisible = true.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool toggleVisibility() {
    isVisible.value = !isVisible.value;
    return isVisible.value;
  }

  Future<void> checkForm() async {
    isLoading.value = true;
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      await authController.login(
        email: emailController.text,
        password: passwordController.text,
      );
      emailController.clear();
      passwordController.clear();
      isLoading.value = false;
    }
    isLoading.value = false;
    passwordController.clear();
  }
}
