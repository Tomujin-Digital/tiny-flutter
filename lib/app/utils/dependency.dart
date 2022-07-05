import 'package:get/get.dart';
import 'package:pocket_tomyo/app/services/auth_repository.dart';
import 'package:pocket_tomyo/app/services/repository.dart';
import 'package:pocket_tomyo/app/utils/api_http_client.dart';

import 'auth_api_http_client.dart';

class DependencyCreator extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthRepository(AuthApiHttpClient()),
    );
    Get.lazyPut(
      () => Repository(),
    );
  }
}
