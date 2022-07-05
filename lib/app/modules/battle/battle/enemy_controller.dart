import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../path/spine.dart';

class Anim {
  final String animation;
  final bool loop;

  const Anim({required this.animation, this.loop = false});
}

class EnemyController {
  final spineCtrl = SpineController();

  EnemyController() {
    idle();
  }

  void sad() {
    spineCtrl.notifier.value = SpineAnimationPayload('sad', loop: true);
  }

  final alignmentNotifier = ValueNotifier<AlignmentGeometry>(
    Alignment.topCenter,
  );
  final hpNotifier = ValueNotifier<int>(100);
  final translationNotifier = ValueNotifier<Offset>(Offset.zero);

  final isDeadNotifier = ValueNotifier<bool>(false);

  final isAttackedNotifier = ValueNotifier<bool>(false);

  void idle() {
    if (true || hpNotifier.value > 40) {
      spineCtrl.notifier.value = SpineAnimationPayload('idle', loop: true);
    } else {
      spineCtrl.notifier.value = SpineAnimationPayload('sad', loop: true);
    }
  }

  void dmg() {
    spineCtrl.notifier.value = SpineAnimationPayload('rec_dmg', loop: false);
  }

  void atk() {
    spineCtrl.notifier.value =
        SpineAnimationPayload('weapon_attack', loop: false);
  }

  Future<void> getHit() async {
    dmg();

    Future.delayed(
      Duration(milliseconds: 700),
      () => idle(),
    );

    isAttackedNotifier.value = true;
    await Future.delayed(Duration(milliseconds: 500));

    isAttackedNotifier.value = false;
    hpNotifier.value = math.max(0, hpNotifier.value - 20);

    // walkTrigger?.change(true);
  }

  static const Duration attackDuration = Duration(milliseconds: 600);
  Future<void> attack() async {
    atk();
    alignmentNotifier.value = Alignment.bottomCenter;
    translationNotifier.value = Offset(90, 90);

    // Future.delayed(
    //   Duration(milliseconds: 400),
    //   () =>
    // );
    await Future.delayed(
      attackDuration,
    );
    translationNotifier.value = Offset.zero;
    alignmentNotifier.value = Alignment.topCenter;
    idle();
  }
}
