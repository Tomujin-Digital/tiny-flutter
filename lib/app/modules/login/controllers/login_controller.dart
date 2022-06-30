import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../0_initial/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  // final authCtrl = Get.find<AuthController>();
  final authController =
      Get.put<AuthController>(AuthController(), permanent: true);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  bool toggleVisibility() {
    isVisible.value = !isVisible.value;
    return isVisible.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkForm() async {
    isLoading.value = true;
    final isValid = formKey.currentState?.validate();
    if (isValid ?? false) {
      await authController.login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
    isLoading.value = false;
  }
}
