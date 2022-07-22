import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../battle/battle_new/components/tree.dart';
import '../../battle/core/components/animations/slushy.dart';

class JourneyBackground extends StatelessWidget {
  const JourneyBackground({
    Key? key,
    required this.listCount,
  }) : super(key: key);
  final int listCount;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/svgs/back_ground.svg',
            fit: BoxFit.cover,
          ),
          for (int i = 1; i < 6; i++)
            Positioned(
              bottom: positionHeight(i),
              right: positionWidth(i),
              child: Container(
                color: Colors.pink,
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    '${i + listCount} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            left: Random().nextInt(40).toDouble(),
            bottom: Random().nextInt(40).toDouble(),
            child: const SlushyAnimation(
              child: FuckingTree(),
            ),
          ),
          Positioned(
            right: Random().nextInt(40).toDouble(),
            top: Random().nextInt(140).toDouble(),
            child: SlushyAnimation(
              child: FuckingBranch(),
            ),
          ),
        ],
      ),
    );
  }

  double positionHeight(int index) {
    switch (index) {
      case 1:
        return 0;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 4;
      case 5:
        return 5;
      default:
        return 1;
    }
  }

  double positionWidth(int index) {
    switch (index) {
      case 1:
        return Get.width / 2;
      case 2:
        return 2;
      case 3:
        return 3;
      case 4:
        return 4;
      case 5:
        return 5;
      default:
        return 1;
    }
  }
}
