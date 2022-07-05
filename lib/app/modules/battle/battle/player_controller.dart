import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../path/spine.dart';

class PlayerController {
  final spineCtrl = SpineController();

  int maxHp = 100;

  PlayerController() {
    idle();
  }

  void idle() {
    // Idle based on health
    if (true || hpNotifier.value > 40) {
      spineCtrl.notifier.value = SpineAnimationPayload('idle', loop: true);
    } else {
      spineCtrl.notifier.value = SpineAnimationPayload('sad', loop: true);
    }
  }

  void dance() {
    spineCtrl.notifier.value = SpineAnimationPayload('dance', loop: true);
  }

  void sad() {
    spineCtrl.notifier.value = SpineAnimationPayload('sad', loop: true);
  }

  void dmg() {
    spineCtrl.notifier.value = SpineAnimationPayload('rec_dmg', loop: false);
  }

  void atk() {
    if (math.Random().nextBool()) {
      spineCtrl.notifier.value =
          SpineAnimationPayload('weapon_attack', loop: false);
    } else {
      spineCtrl.notifier.value =
          SpineAnimationPayload('bare_hand_attack', loop: false);
    }
  }

  final alignmentNotifier = ValueNotifier<AlignmentGeometry>(
    Alignment.bottomCenter,
  );

  final translationNotifier = ValueNotifier<Offset>(Offset.zero);

  final hpNotifier = ValueNotifier<int>(100);

  final isDeadNotifier = ValueNotifier<bool>(false);

  final isAttackedNotifier = ValueNotifier<bool>(false);

  static const Duration attackDuration = Duration(milliseconds: 600);

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

  Future<void> attack() async {
    atk();
    alignmentNotifier.value = Alignment.topCenter;
    translationNotifier.value = Offset(-70.0, -90.0);

    // Future.delayed(
    //   Duration(milliseconds: 400),
    //   () =>
    // );
    await Future.delayed(
      attackDuration,
    );

    translationNotifier.value = Offset.zero;
    alignmentNotifier.value = Alignment.bottomCenter;
    idle();
  }
}
