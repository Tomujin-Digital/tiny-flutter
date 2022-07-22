import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../0_initial/controllers/auth_controller.dart';
import '../../../services/auth_repository.dart';

import '../../../services/local_storage.dart';

class RegisterController extends GetxController {
  /// [PageController] for the [PageView]
  PageController pageController = PageController();
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  /// The number of pages in the [PageView] on the [RegisterView].
  static const totalPages = 7;

  /// The current page in the [PageView] on the [RegisterView].
  final currentPage = 0.obs;
  final isLoading = false.obs;

  /// The bool value to determine if the user is on the last page.
  final isLast = false.obs;
  final isAvailable = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final birthdayController = TextEditingController();
  final otpController = TextEditingController();
  final otpVerifyController = TextEditingController();
  final day = 1.obs;
  final month = 1.obs;
  final year = 2000.obs;
  List<int> days = List.generate(31, (i) => i + 1);
  List<int> months = List.generate(12, (i) => i + 1);
  List<int> years = List.generate(123, (i) => i + 1900);

  /// username 88811988
  /// password 0250@nik

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  onPressed() async {
    print(currentPage.value);
    switch (currentPage.value) {
      case 0:
        toNextPage();
        break;
      case 1:
        checkUserName();
        break;

      /// if the user name is already taken, show an error message.

      case 2:
        toNextPage();
        break;
      case 3:
        checkPassword();
        break;
      case 4:
        checkPhone();
        break;
      case 5:
        checkOtpAndRegister();
        break;
      case 6:
        Get.back();
        break;
      default:
      //  checkIslastAndNextPage();
    }
  }

  checkOtpAndRegister() async {
    final dateTime = DateTime(year.value, month.value, day.value);
    dateTime.toIso8601String();

    try {
      final res = await _authRepository.register(
          userNameController.text,
          phoneController.text,
          dateTime.toIso8601String(),
          passwordController.text,
          otpVerifyController.text);
      print(res);
      final storage = Get.find<LocalStorageService>();
      await storage.write(LocalStorageKey.token, res.data['access_token']);
      await storage.write(
          LocalStorageKey.refrshToken, res.data['refresh_token']);
      await Future.delayed(Duration(seconds: 2));
      await Get.find<AuthController>().checkToken();
      toNextPage();
    } on DioError catch (e) {
      print(e.error);
      print(e);
      final error = e.response?.data['message'];
      if (error != null) {
        Get.snackbar(
          'Error',
          error.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  bool isPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  checkPassword() {
    final isPwrd = isPassword(passwordController.text);
    if (!isPwrd) {
      Get.snackbar(
        'Password is weak',
        'Password must be at least 8 characters long, and contain at least one number, one letter and one special character',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
    } else {
      if (passwordController.text != confirmPasswordController.text ||
          passwordController.text.isEmpty) {
        Get.snackbar('Error', 'Password does not match',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        toNextPage();
      }
    }
  }

  toNextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic);
  }

  void checkUserName() async {
    final isValid = registerFormKey.currentState!.validate();
    if (isAvailable.value && isValid && isLoading.value == false) {
      toNextPage();
    } else {
      if (isValid) {
        Get.showSnackbar(
          const GetSnackBar(
            borderRadius: 12,
            title: 'This user name is already taken',
            message: 'Please try another user name',
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            borderRadius: 12,
            title: 'Please enter a valid user name',
            message: 'Please try another user name',
          ),
        );
      }
    }
  }

  checkPhone() async {
    if (phoneController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your phone number',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } else {
      Get.find<AuthRepository>().sendOtp(phoneController.text);
      toNextPage();
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    birthdayController.dispose();
    otpController.dispose();
    otpVerifyController.dispose();
    super.onClose();
  }
}
