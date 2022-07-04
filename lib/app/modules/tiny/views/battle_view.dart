import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';

class BattleView extends GetView {
  const BattleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppConstants.padding168,
        child: ListView(
          children: [
            Text(
              'Choose mode',
              style: TextStyle(
                  color: secondary, fontWeight: FontWeight.bold, fontSize: 28),
            ),
            AppConstants.vTitleSpacing,
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: AppConstants.borderRadius,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
