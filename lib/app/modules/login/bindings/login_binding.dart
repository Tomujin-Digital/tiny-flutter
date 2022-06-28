import 'package:get/get.dart';

import 'package:pocket_tomyo/app/modules/login/controllers/register_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
