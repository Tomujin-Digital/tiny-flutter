import 'package:get/get.dart';
import '../../leaderboard/bindings/leaderboard_binding.dart';
import '../../marketplace/bindings/marketplace_binding.dart';
import '../../newsfeed/newsfeed.dart';
import '../../notifcation/bindings/notifcation_binding.dart';

import '../../profile/bindings/profile_binding.dart';
import '../controllers/initial_controller.dart';

class InitialBinding extends Bindings {
  /// Binding all main screen's controllers [InitialController]
  @override
  void dependencies() {
    Get.put<InitialController>(InitialController(), permanent: true);
    // Get.lazyPut<AuthController>(
    //   () => AuthController(),
    //   // fenix: true,
    // );
    NewsFeedBinding().dependencies();
    MarketplaceBinding().dependencies();
    NotifcationBinding().dependencies();
    LeaderboardBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
