import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///  Profile tab bar items
enum ProfileTabType { progress, wallet, rooms }

extension TabItem on ProfileTabType {
  Widget get tabWidget {
    String svgPath = 'assets/svgs/profile/';
    switch (this) {
      case ProfileTabType.progress:
        svgPath += 'chart';
        break;
      case ProfileTabType.wallet:
        svgPath += 'wallet';
        break;
      case ProfileTabType.rooms:
        svgPath += 'saved';
        break;
    }
    return Center(
      child: SvgPicture.asset(
        height: 28.0,
        '$svgPath.svg',
      ),
    );
  }

  Widget get activeTabWidget {
    String svgPath = 'assets/svgs/profile/';
    switch (this) {
      case ProfileTabType.progress:
        svgPath += 'chart_active';
        break;
      case ProfileTabType.wallet:
        svgPath += 'wallet_active';
        break;
      case ProfileTabType.rooms:
        svgPath += 'saved_active';
        break;
    }
    return Center(
      child: SvgPicture.asset(
        '$svgPath.svg',
        height: 28.0,
      ),
    );
  }
}
