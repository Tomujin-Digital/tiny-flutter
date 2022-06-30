import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/services/local_storage.dart';
import 'package:pocket_tomyo/app/utils/api_http_client.dart';

import '../../../utils/auth_api_http_client.dart';

enum AuthStatus {
  loggedIn,
  loggedOut,
}

class AuthController extends GetxController {
  final status = AuthStatus.loggedOut.obs;

  final storage = Get.find<LocalStorageService>();
  get token async => await storage.read(LocalStorageKey.token);
  get refreshToken async => await storage.read(LocalStorageKey.refrshToken);

// Write value

  @override
  void onInit() async {
    print('AuthController: onInit');
    super.onInit();
    checkToken();
    status.firstRebuild = false;
  }

  checkToken() async {
    final token = await storage.read(LocalStorageKey.token);
    if (token != null) {
      print('logged in');
      status.value = AuthStatus.loggedIn;
    } else {
      print('not logged in');
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
      print(e);
    }

    checkToken();
  }

  refreshTokenFromApi() {}
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
