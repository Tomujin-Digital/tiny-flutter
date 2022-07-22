import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/app/modules/tiny/views/battle_detail_view.dart';
import 'package:pocket_tomyo/app/modules/tiny/widgets/battle_card_widget.dart';

class BattleView extends GetView {
  const BattleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: C.padding168,
        child: ListView(
          children: [
            const Text(
              'Choose mode',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            C.vTitleSpacing,
            BattleCardWidget(
              isLocked: false,
              imagePath: 'assets/images/tiny/battle_back.png',
              title: 'Battle',
              onPressed: () {
                Get.to(() => BattleDetailView());
              },
            ),
            C.vTitleSpacing,
            BattleCardWidget(
                isLocked: true,
                imagePath: 'assets/images/tiny/battle_back.png',
                title: 'Boss Hunt'),
            C.vTitleSpacing,
            BattleCardWidget(
                isLocked: true,
                imagePath: 'assets/images/tiny/battle_back.png',
                title: 'Defence Battle'),
            C.vTitleSpacing,
            BattleCardWidget(
                isLocked: true,
                imagePath: 'assets/images/tiny/battle_back.png',
                title: 'Madness'),
          ],
        ),
      )),
    );
  }
}
