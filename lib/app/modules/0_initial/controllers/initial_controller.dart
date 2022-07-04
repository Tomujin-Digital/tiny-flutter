import 'package:flutter/material.dart';

import 'package:pocket_tomyo/app/modules/home/views/home_view.dart';
import 'package:pocket_tomyo/app/modules/profile/views/profile_view.dart';
import 'package:pocket_tomyo/app/modules/programs/views/programs_view.dart';
import 'package:pocket_tomyo/app/modules/tiny/views/tiny_view.dart';
import 'package:pocket_tomyo/library/main_controller.dart';

import '../../leaderboard/views/leaderboard_view.dart';
import '../../notifcation/views/notifcation_view.dart';

class InitialController extends MainController {
  late HomeView homeView;
  late ProgramsView programsView;
  late TinyView tinyView;
  // late NotifcationView notifcationView;
  late LeaderboardView leaderboardView;
  late ProfileView profileView;
  @override
  void onInit() {
    homeView = HomeView();
    programsView = ProgramsView();
    tinyView = TinyView();
    // notifcationView = NotifcationView();
    leaderboardView = LeaderboardView();
    profileView = ProfileView();
    super.onInit();
  }

  int _selectedIndex = 2;
  get getselectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  Widget get getSelectedPage {
    switch (_selectedIndex) {
      case 0:
        return homeView;
      case 1:
        return programsView;
      case 2:
        return tinyView;
      case 3:
        return leaderboardView;
      case 4:
        return profileView;
      default:
        return homeView;
    }
  }
}
