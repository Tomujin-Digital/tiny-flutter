import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';

class SlushyAnimation extends StatefulWidget {
  const SlushyAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  State<SlushyAnimation> createState() => _SlushyAnimationState();
}

class _SlushyAnimationState extends State<SlushyAnimation> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: const ValueKey("2"),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOutCubicEmphasized,
      builder: (context, value, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..scale(lerp(0.5, 1.0, value))
            ..translate(0.0, lerp(300.0, 0.0, value), 0.0)
            ..rotateY(lerp(8.0, 0.0, value))
            ..rotateZ(lerp(-2, 0.0, value)),
          alignment: FractionalOffset.center,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
