import 'package:pocket_tomyo/app/utils/auth_api_http_client.dart';

class Repository {
  final AuthApiHttpClient client;

  Repository(this.client);
  getUserById(String id) {
    return client.get('/users/$id');
  }
}
