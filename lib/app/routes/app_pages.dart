import 'package:get/get.dart';

import '../modules/0_initial/bindings/initial_binding.dart';
import '../modules/0_initial/views/initial_view.dart';

import '../modules/journey/bindings/journey_binding.dart';
import '../modules/journey/views/journey_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/marketplace/bindings/marketplace_binding.dart';
import '../modules/marketplace/views/marketplace_view.dart';
import '../modules/newsfeed/newsfeed.dart';
import '../modules/notifcation/bindings/notifcation_binding.dart';
import '../modules/notifcation/views/notifcation_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

import '../modules/tiny/bindings/tiny_binding.dart';
import '../modules/tiny/views/tiny_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => NewsFeedView(),
      binding: NewsFeedBinding(),
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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TINY,
      page: () => const TinyView(),
      binding: TinyBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.JOURNEY,
      page: () => const JourneyView(),
      binding: JourneyBinding(),
    ),
    GetPage(
      name: _Paths.MARKETPLACE,
      page: () => const MarketplaceView(),
      binding: MarketplaceBinding(),
    ),
  ];
}
