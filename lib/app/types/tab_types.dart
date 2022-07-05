import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// [NavigationBar] widget - үүд
enum TabType { home, programs, notifcation, leaderBoard, profile }

extension TabItem on TabType {
  /// [NavigationBar] сонгогдоогүй үед харагдах [Widget] үүд
  /// [SvgPicture] төрлийн widget [return] хийх хэрэгтэй
  Widget get tabWidget {
    String svgPath = 'assets/svgs/nav/';
    switch (this) {
      case TabType.home:
        svgPath += 'home';
        break;
      case TabType.programs:
        svgPath += 'search';
        break;
      case TabType.notifcation:
        svgPath += 'tiny';
        break;
      case TabType.leaderBoard:
        svgPath += 'leader_board';
        break;
      case TabType.profile:
        svgPath += 'profile';
        break;
    }
    return Center(
      child: SvgPicture.asset(
        height: 28.0,
        '$svgPath.svg',
      ),
    );
  }

  /// [NavigationBar] сонгогдсон үед харагдах [Widget] үүд
  /// [SvgPicture] төрлийн widget [return] хийх хэрэгтэй
  Widget get tabActiveWidget {
    String svgPath = 'assets/svgs/nav/';
    switch (this) {
      case TabType.home:
        svgPath += 'home_active';
        break;
      case TabType.programs:
        svgPath += 'search_active';
        break;
      case TabType.notifcation:
        svgPath += 'tiny_active';
        break;
      case TabType.leaderBoard:
        svgPath += 'leader_board_active';
        break;
      case TabType.profile:
        svgPath += 'profile_active';
        break;
    }
    return Center(
      child: SvgPicture.asset(
        height: 28.0,
        '$svgPath.svg',
      ),
    );
  }

  String get title {
    switch (this) {
      case TabType.home:
        return "Home";
      case TabType.programs:
        return "programs";
      case TabType.profile:
        return "Profile";
      case TabType.notifcation:
        return "Notification";
      case TabType.leaderBoard:
        return "LeaderBoard";
    }
  }
}
