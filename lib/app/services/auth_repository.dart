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

  Future<dynamic> register(String username, String countryCode, String phone,
      String birthDate, String password) async {
    return await client.post('/auth/register', data: {
      "username": username,
      "phone": '$countryCode|$phone',
      "birthDate": birthDate,
      "password": password,
    });
  }
}
