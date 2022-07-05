import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../../../../widgets/leader_board_item.dart';
import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends MainView {
  LeaderboardView({Key? key}) : super(key: key);
  final leaderboardController = Get.put(LeaderboardController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: C.padding168,
                child: LeaderBoardItem(index: index + 1),
              );
            },
          ),
        ],
      ),
    );
  }
}
