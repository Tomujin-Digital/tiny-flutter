import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../../library/main_view.dart';

import '../controllers/leaderboard_controller.dart';
import '../widgets/widgets.dart';

class LeaderboardView extends MainView {
  LeaderboardView({Key? key}) : super(key: key);
  final leaderboardController = Get.put(LeaderboardController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        /// first 3 items are the top 3 users

        return Padding(
          padding: C.padding168,
          child: LeaderBoardItem(index: index + 1),
        );
      },
    );
  }
}
