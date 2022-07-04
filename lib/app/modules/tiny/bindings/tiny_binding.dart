import 'package:get/get.dart';

import '../controllers/tiny_controller.dart';

class TinyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TinyController>(
      () => TinyController(),
    );
  }
}
