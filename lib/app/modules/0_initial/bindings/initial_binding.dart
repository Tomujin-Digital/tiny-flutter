import 'package:get/get.dart';
import '../../leaderboard/bindings/leaderboard_binding.dart';
import '../../notifcation/bindings/notifcation_binding.dart';
import '../../programs/bindings/programs_binding.dart';

import '../../home/bindings/home_binding.dart';
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
    HomeBinding().dependencies();
    ProgramsBinding().dependencies();
    NotifcationBinding().dependencies();
    LeaderboardBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
