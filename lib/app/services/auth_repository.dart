import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../utils/auth_api_http_client.dart';

class AuthRepository extends GetxService {
  final AuthApiHttpClient client;

  AuthRepository(this.client);

  Future<dynamic> login(String email, String password) async {
    return await client.post('/auth/login', data: {
      'credential': email,
      'password': password,
    });
  }

  Future<dynamic> checkUserName(String userName) async {
    return await client.get('/user/username', queryParameters: {
      'q': userName,
    });
  }

  Future<dynamic> sendOtp(String phone) async {
    return await client.post('/auth/check', data: {
      "phone": '976|$phone',
    });
  }

  Future<dynamic> register(String userName, String phone, String birthDate,
      String password, String otpNumber) async {
    final data = {
      "username": userName,
      "phone": '976|$phone',
      "birthDate": birthDate,
      "password": password,
    };
    print(data);
    print(otpNumber);
    return await client.post('/auth/register',
        options: Options(
          headers: {
            'otp': otpNumber,
          },
        ),
        data: data);
  }
}
