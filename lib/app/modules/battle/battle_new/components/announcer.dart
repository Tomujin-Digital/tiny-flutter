import 'package:flutter/material.dart';
import '../battle_controller.dart';

class Announcer extends StatefulWidget {
  const Announcer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnnouncerController controller;

  @override
  State<Announcer> createState() => _AnnouncerState();
}

class _AnnouncerState extends State<Announcer> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.currentStateNotifier,
      builder: (ctx, state, _) {
        if (state == AnnouncerState.end || state == AnnouncerState.hidden) {
          return const SizedBox();
        }
        if (state == AnnouncerState.fight) {
          return TweenAnimationBuilder<double>(
            key: ValueKey(state),
            duration: Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 1.5, end: 1.0),
            builder: (context, anim, child) {
              return Transform.scale(
                scale: anim,
                child: child,
              );
            },
            child: Text(
              "FIGHT!",
              style: TextStyle(
                fontSize: 72,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        }

        late int index;

        if (state == AnnouncerState.start1) {
          index = 1;
        } else if (state == AnnouncerState.start2) {
          index = 2;
        } else if (state == AnnouncerState.start3) {
          index = 3;
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "START",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            TweenAnimationBuilder<double>(
              key: ValueKey(state),
              duration: Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 1.5, end: 1.0),
              builder: (context, anim, child) {
                return Transform.scale(
                  scale: anim,
                  child: child,
                );
              },
              child: Text(
                "$index",
                style: TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
