import 'package:get/get.dart';

import '../modules/0_initial/bindings/initial_binding.dart';
import '../modules/0_initial/views/initial_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifcation/bindings/notifcation_binding.dart';
import '../modules/notifcation/views/notifcation_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/programs/bindings/programs_binding.dart';
import '../modules/programs/views/programs_view.dart';

import '../modules/tiny/bindings/tiny_binding.dart';
import '../modules/tiny/views/tiny_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFCATION,
      page: () => NotifcationView(),
      binding: NotifcationBinding(),
    ),
    GetPage(
      name: _Paths.PROGRAMS,
      page: () => ProgramsView(),
      binding: ProgramsBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TINY,
      page: () => const TinyView(),
      binding: TinyBinding(),
    ),
  ];
}
