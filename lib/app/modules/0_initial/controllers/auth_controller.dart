import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/services/local_storage.dart';
import 'package:pocket_tomyo/app/utils/api_http_client.dart';

import '../../../services/auth_repository.dart';
import '../../../utils/auth_api_http_client.dart';

enum AuthStatus {
  loggedIn,
  loggedOut,
}

class AuthController extends GetxController {
  final status = AuthStatus.loggedOut.obs;

  final storage = Get.find<LocalStorageService>();
  final _repository = Get.find<AuthRepository>();

// Write value

  @override
  void onInit() async {
    super.onInit();
    checkToken();
    // status.firstRebuild = false;
  }

  checkToken() async {
    final token = await storage.read(LocalStorageKey.token);
    if (token != null) {
      status.value = AuthStatus.loggedIn;
    } else {
      status.value = AuthStatus.loggedOut;
    }
  }

  logOut() {
    storage.delete(LocalStorageKey.token);
    storage.delete(LocalStorageKey.refrshToken);
    status.value = AuthStatus.loggedOut;
  }

  login({required String email, required String password}) async {
    try {
      final response = await AuthApiHttpClient().post('/auth/login', data: {
        'credential': email,
        'password': password,
      });
      await storage.write(LocalStorageKey.token, response.data['accessToken']);
      await storage.write(
          LocalStorageKey.refrshToken, response.data['refreshToken']);
      checkToken();
    } on DioError catch (e) {
      final message = e.response?.data['message'];

      Get.snackbar('Error', message ?? 'Something went wrong',
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    checkToken();
  }

  refreshTokenFromApi() async {
    print('refreshing token');
    final refreshToken = await storage.read(LocalStorageKey.refrshToken);

    try {
      final response = await _repository.refreshToken(refreshToken ?? "");

      await storage.write(LocalStorageKey.token, response.data['accessToken']);
      await storage.write(
          LocalStorageKey.refrshToken, response.data['refreshToken']);
      checkToken();
    } on DioError catch (e) {
      final message = e.response?.data['message'];

      Get.snackbar('Error', message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
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
