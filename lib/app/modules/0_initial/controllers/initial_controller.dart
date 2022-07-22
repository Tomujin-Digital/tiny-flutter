import 'package:flutter/material.dart';

import '../../../../library/main_controller.dart';
import '../../leaderboard/views/leaderboard_view.dart';
import '../../marketplace/views/marketplace_view.dart';
import '../../newsfeed/views/newsfeed_view.dart';
import '../../profile/views/profile_view.dart';
import '../../tiny/views/tiny_view.dart';

class InitialController extends MainController {
  late NewsFeedView homeView;
  late MarketplaceView marketplaceView;
  late TinyView tinyView;
  // late NotifcationView notifcationView;
  late LeaderboardView leaderboardView;
  late ProfileView profileView;
  @override
  void onInit() {
    homeView = NewsFeedView();
    marketplaceView = MarketplaceView();
    tinyView = const TinyView();
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
        return marketplaceView;
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
