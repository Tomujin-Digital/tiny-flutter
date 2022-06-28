import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  /// [PageController] for the [PageView]
  late PageController pageController;

  /// The number of pages in the [PageView] on the [RegisterView].
  static const totalPages = 5;

  /// The current page in the [PageView] on the [RegisterView].
  final currentPage = 0.obs;

  /// The bool value to determine if the user is on the last page.
  final isLast = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdayController = TextEditingController();
  final otpController = TextEditingController();

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  nextPage() {
    /// validate the form and move to the next page
    switch (currentPage.value) {
      case 1:
        checkController(userNameController);
        break;
      case 2:
        checkController(birthdayController);
        break;
      case 3:
        checkController(passwordController);
        checkController(confirmPasswordController);
        break;
      case 4:
        checkController(phoneController);
        break;
      case 5:
        checkController(otpController);
        break;
      default:
        pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  checkController(TextEditingController controller) {
    if (controller.text.isEmpty) {
      registerFormKey.currentState!.validate();
    } else {
      if (currentPage.value < totalPages - 1) {
        currentPage.value++;
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
        );
      } else {
        isLast.value = true;
      }
    }
  }

  @override
  void onInit() {
    pageController = PageController(
      initialPage: currentPage.value,
    );
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
}
