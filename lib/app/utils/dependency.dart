import 'package:get/get.dart';
import 'package:pocket_tomyo/app/services/auth_repository.dart';

import 'auth_api_http_client.dart';

class DependencyCreator extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthRepository(AuthApiHttpClient()),
    );
    // Get.lazyPut<MainView>(() => const MainView());

    // Get.lazyPut<MainController>(() => MainController());
    // get current theme mode from shared preferences
    //  Get.lazyPut<ThemeMode>(() => ThemeMode.system);
  }
}
