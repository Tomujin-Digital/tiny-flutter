import 'package:get/get.dart';

import '../../library/main_controller.dart';

class DependencyCreator extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<MainView>(() => const MainView());
    Get.lazyPut<MainController>(() => MainController());
  }
}
