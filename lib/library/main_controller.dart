import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasNetwork = false.obs;
  RxBool hasError = false.obs;

  // void setLoading(bool value) => _isLoading.value = value;

  showErrorDialog() async {
    return Get.defaultDialog(
        title: "Welcome to Flutter Dev'S",
        middleText:
            "FlutterDevs is a protruding flutter app development company with "
            "an extensive in-house team of 30+ seasoned professionals who know "
            "exactly what you need to strengthen your business across various dimensions",
        backgroundColor: Colors.teal,
        radius: 30);
  }

  showSuccessDialog() {}
}
