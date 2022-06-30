import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  /// [PageController] for the [PageView]
  late PageController pageController;

  /// The number of pages in the [PageView] on the [RegisterView].
  static const totalPages = 7;

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
  final otpVerifyController = TextEditingController();

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  nextPage() async {
    /// validate the form and move to the next page
    switch (currentPage.value) {
      case 1:
        checkController(userNameController);
        break;
      case 2:
        checkController(birthdayController);
        break;
      case 3:
        checkController(passwordController, isCheckTwo: true);
        checkController(confirmPasswordController);
        break;
      case 4:
        checkController(phoneController);
        break;
      case 5:
        print('case 5');
        checkController(otpVerifyController);
        break;

      default:
        checkIslastAndNextPage();
    }
  }

  checkController(TextEditingController controller,
      {bool isCheckTwo = false}) async {
    if (controller.text.isEmpty) {
      print('Text is here');
      print(controller.text);
      print('controller is empty');
      registerFormKey.currentState!.validate();
    } else {
      /// async function to connect to the server and check if the user name is available
      bool isCorreect = await checkCondition();

      /// checking condition of each case
      if (isCorreect) {
        if (currentPage.value < totalPages - 1 && !isCheckTwo) {
          currentPage.value++;
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
          );
        } else {
          checkIslastAndNextPage();
        }
      }
    }
  }

  checkIslastAndNextPage() {
    print('someting ');
    if (currentPage.value == totalPages) {
      currentPage.value == totalPages
          ? isLast.value = true
          : isLast.value = false;
      print('go to next section');

      /// Login to the app

    } else {
      currentPage.value++;
      print(currentPage.value);
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
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

  Future<bool> checkCondition() async {
    return true;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
