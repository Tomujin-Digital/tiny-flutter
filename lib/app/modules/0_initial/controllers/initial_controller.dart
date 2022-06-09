import 'package:flutter/material.dart';

import 'package:pocket_tomyo/app/modules/home/views/home_view.dart';
import 'package:pocket_tomyo/app/modules/profile/views/profile_view.dart';
import 'package:pocket_tomyo/app/modules/programs/views/programs_view.dart';
import 'package:pocket_tomyo/library/main_controller.dart';

import '../../leaderboard/views/leaderboard_view.dart';
import '../../notifcation/views/notifcation_view.dart';

class InitialController extends MainController {
  late HomeView homeView;
  late ProgramsView programsView;
  late NotifcationView notifcationView;
  late LeaderboardView leaderboardView;
  late ProfileView profileView;
  int _selectedIndex = 0;
  Widget changeIndex(int index) {
    _selectedIndex = index;
    update();
    switch (index) {
      case 0:
        return homeView;
      case 1:
        return programsView;
      case 2:
        return notifcationView;
      case 3:
        return leaderboardView;
      case 4:
      default:
        return profileView;
    }
  }

  get getselectedIndex => _selectedIndex;

  /// Initialize all main screen's views [View]
  @override
  void onInit() {
    homeView = const HomeView();
    programsView = ProgramsView();
    notifcationView = NotifcationView();
    leaderboardView = LeaderboardView();
    profileView = ProfileView();
    super.onInit();
  }
}
