import 'package:get/get.dart';

class DependencyCreator extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MainView>(() => const MainView());

    // Get.lazyPut<MainController>(() => MainController());
    // get current theme mode from shared preferences
    //  Get.lazyPut<ThemeMode>(() => ThemeMode.system);
  }
}
