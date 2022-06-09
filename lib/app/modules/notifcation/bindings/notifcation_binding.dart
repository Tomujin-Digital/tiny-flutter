import 'package:get/get.dart';

import '../controllers/notifcation_controller.dart';

class NotifcationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifcationController>(
      () => NotifcationController(),
    );
  }
}
