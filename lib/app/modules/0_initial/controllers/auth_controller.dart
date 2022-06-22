import 'package:get/get.dart';
import 'package:pocket_tomyo/app/services/local_storage.dart';

import '../../login/views/login_view.dart';
import '../views/initial_view.dart';

enum AuthStatus {
  loggedIn,
  loggedOut,
}

class AuthController extends GetxController {
  final status = AuthStatus.loggedOut.obs;
  @override
  void onInit() async {
    final token =
        await Get.find<LocalStorageService>().read(LocalStorageKey.token);
    status.firstRebuild = false;
    if (token != null) {
      print('logged in');
      status.value = AuthStatus.loggedIn;
    } else {
      print('not logged in');
      status.value = AuthStatus.loggedOut;
    }
    ever(status, (status) {
      if (status == AuthStatus.loggedIn) {
        Get.off(() => InitialView());
      } else {
        Get.off(() => LoginView());
      }
    });
    super.onInit();
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