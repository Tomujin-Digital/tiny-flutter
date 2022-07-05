import 'package:flutter/material.dart';

class IZoom extends StatelessWidget {
  const IZoom({
    Key? key,
    required this.child,
    this.begin = 1.35,
    this.end = 1.0,
  }) : super(key: key);

  final double begin;
  final double end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      builder: (context, anim, _) {
        return Transform.scale(
          scale: anim,
          child: child,
        );
      },
    );
  }
}
