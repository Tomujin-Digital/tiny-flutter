import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../path/spine.dart';
import '../enemy_controller.dart';
import '../player_controller.dart';

class BattleDrawablesLayer extends StatelessWidget {
  const BattleDrawablesLayer({
    Key? key,
    required this.playerController,
    required this.enemyController,
  }) : super(key: key);

  final PlayerController playerController;
  final EnemyController enemyController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _EnemyLayer(
          controller: enemyController,
        ),
        _PlayerLayer(
          controller: playerController,
        ),
      ],
    );
  }
}

class _EnemyLayer extends StatelessWidget {
  const _EnemyLayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final EnemyController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableTweenBuilder<AlignmentGeometry>(
      valueListenable: controller.alignmentNotifier,
      curve: Curves.easeInOutCubicEmphasized,
      duration: PlayerController.attackDuration,
      builder: (ctx, alignment, child) {
        return Align(
          alignment: alignment,
          child: child,
        );
      },
      child: ValueListenableTweenBuilder<Offset>(
        valueListenable: controller.translationNotifier,
        curve: Curves.easeInOutCubicEmphasized,
        duration: PlayerController.attackDuration,
        builder: (ctx, translation, child) {
          return Transform.translate(
            offset: translation,
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 156, top: 156.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: 120.0,
                  child: Container(
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 11, 50),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.centerLeft,
                    child: ValueListenableBuilder<int>(
                      valueListenable: controller.hpNotifier,
                      builder: (context, hp, child) {
                        final hpPercent = controller.hpNotifier.value / 100.0;
                        return TweenAnimationBuilder<double>(
                          tween:
                              Tween<double>(begin: hpPercent, end: hpPercent),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubicEmphasized,
                          builder: (ctx, hpAnim, _) => FractionallySizedBox(
                            widthFactor: hpAnim,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: controller.isAttackedNotifier,
                builder: (context, isAttacked, child) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: isAttacked ? 0.8 : 0.0,
                      end: isAttacked ? 0.8 : 0.0,
                    ),
                    duration: const Duration(milliseconds: 200),
                    builder: (context, redOpacity, _) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.red.withOpacity(redOpacity),
                          BlendMode.srcATop,
                        ),
                        child: child,
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 128,
                  child: Spine(
                    'boss',
                    controller: controller.spineCtrl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ValueListenableTweenBuilder<T> extends StatelessWidget {
  const ValueListenableTweenBuilder({
    Key? key,
    required this.valueListenable,
    required this.builder,
    required this.duration,
    required this.curve,
    this.child,
  }) : super(key: key);

  final ValueListenable<T> valueListenable;
  final Curve curve;
  final Duration duration;
  final Widget? child;
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: valueListenable,
      builder: (_, value, __) => TweenAnimationBuilder<T>(
        tween: Tween<T>(begin: value, end: value),
        duration: duration,
        curve: curve,
        builder: (context, value, _) => builder(context, value, child),
      ),
    );
  }
}

class _PlayerLayer extends StatelessWidget {
  const _PlayerLayer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableTweenBuilder<AlignmentGeometry>(
      valueListenable: controller.alignmentNotifier,
      curve: Curves.easeInOutCubicEmphasized,
      duration: PlayerController.attackDuration,
      builder: (ctx, alignment, child) {
        return Align(
          alignment: alignment,
          child: child,
        );
      },
      child: ValueListenableTweenBuilder<Offset>(
        valueListenable: controller.translationNotifier,
        curve: Curves.easeInOutCubicEmphasized,
        duration: PlayerController.attackDuration,
        builder: (ctx, translation, child) {
          return Transform.translate(
            offset: translation,
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 96, top: 255.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: 120.0,
                  child: Container(
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 27, 11, 50),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.centerLeft,
                    child: ValueListenableBuilder<int>(
                      valueListenable: controller.hpNotifier,
                      builder: (context, hp, child) {
                        final hpPercent = controller.hpNotifier.value / 100.0;
                        return TweenAnimationBuilder<double>(
                          tween:
                              Tween<double>(begin: hpPercent, end: hpPercent),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubicEmphasized,
                          builder: (ctx, hpAnim, _) => FractionallySizedBox(
                            widthFactor: hpAnim,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: controller.isAttackedNotifier,
                builder: (context, isAttacked, child) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: isAttacked ? 0.6 : 0.0,
                      end: isAttacked ? 0.6 : 0.0,
                    ),
                    duration: const Duration(milliseconds: 200),
                    builder: (context, redOpacity, _) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.red.withOpacity(redOpacity),
                          BlendMode.srcATop,
                        ),
                        child: child,
                      );
                    },
                  );
                },
                child: SizedBox(
                  height: 128,
                  child: Transform(
                    transform: Matrix4.rotationY(math.pi),
                    alignment: Alignment.center,
                    child: Spine(
                      'player',
                      controller: controller.spineCtrl,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
