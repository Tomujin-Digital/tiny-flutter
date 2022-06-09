import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends MainView {
  LeaderboardView({Key? key}) : super(key: key);
  final leaderboardController = Get.put(LeaderboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeaderboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LeaderboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
