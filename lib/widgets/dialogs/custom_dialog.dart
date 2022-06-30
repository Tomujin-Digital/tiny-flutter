import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController errorDialog(String title, String message) {
  return Get.snackbar('', '',
      backgroundColor: Colors.white,
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(message),
      snackPosition: SnackPosition.TOP);
}
