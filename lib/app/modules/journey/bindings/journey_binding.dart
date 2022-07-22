import 'package:get/get.dart';

import '../controllers/journey_controller.dart';

class JourneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneyController>(
      () => JourneyController(),
    );
  }
}
