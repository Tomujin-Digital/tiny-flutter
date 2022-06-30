import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/leaderboard/bindings/leaderboard_binding.dart';
import 'package:pocket_tomyo/app/modules/notifcation/bindings/notifcation_binding.dart';
import 'package:pocket_tomyo/app/modules/programs/bindings/programs_binding.dart';

import '../../home/bindings/home_binding.dart';
import '../../profile/bindings/profile_binding.dart';
import '../controllers/auth_controller.dart';
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
