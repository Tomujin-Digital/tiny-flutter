import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'tree.dart';

import '../../core/components/animations/idle_bounce.dart';
import '../../utilities/utilities.dart';

class AnimatedTree extends StatelessWidget {
  const AnimatedTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      builder: (context, anim, child) {
        print(anim);
        final double scaleY =
            Tween<double>(begin: 0.5, end: 1.0).transform(anim);
        return Transform.scale(
          scaleY: scaleY,
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
      child: IdleBounce(
        offset: math.Random().nextDouble(),
        duration: const Duration(seconds: 2),
        builder: (ctx, child, anim) {
          return Transform.rotate(
            angle: lerp(-0.06, 0.06, anim),
            alignment: Alignment.bottomCenter,
            child: child,
          );
        },
        child: const FuckingTree(),
      ),
    );
  }
}
