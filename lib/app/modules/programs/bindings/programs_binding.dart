import 'package:get/get.dart';

import '../controllers/programs_controller.dart';

class ProgramsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramsController>(
      () => ProgramsController(),
    );
  }
}
