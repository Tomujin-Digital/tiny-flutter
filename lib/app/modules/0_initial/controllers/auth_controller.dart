import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/local_storage.dart';
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
    final refreshToken = await storage.read(LocalStorageKey.refrshToken);

    try {
      final response = await _repository.refreshToken(refreshToken ?? "");
      print(response.data);

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
}
