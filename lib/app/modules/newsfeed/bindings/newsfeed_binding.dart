import 'package:get/get.dart';

import '../controllers/newsfeed_controller.dart';

class NewsFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsFeedController>(
      () => NewsFeedController(),
    );
  }
}
