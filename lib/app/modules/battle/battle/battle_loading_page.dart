import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../battle_new/battle_screen.dart';
import '../core/components/animations/idle_bounce.dart';
import '../path/spine.dart';
import 'components/finding_match.dart';

class VersusScreen extends StatefulWidget {
  const VersusScreen({Key? key}) : super(key: key);

  @override
  State<VersusScreen> createState() => _VersusScreenState();
}

class _VersusScreenState extends State<VersusScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => BattleScreen(),
      )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: VersusScreenPainter(),
              child: const Center(
                child: Text(
                  "VS",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 96.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: 210,
                      width: 210,
                      child: Transform(
                        transform: Matrix4.rotationY(math.pi),
                        alignment: Alignment.center,
                        child: Spine(
                          'player',
                          initialAnimation: SpineAnimationPayload.idle,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Daimaa",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Level 2",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 96.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: 210,
                      width: 210,
                      child: Spine(
                        'boss',
                        initialAnimation: SpineAnimationPayload.idle,
                      ),
                    ),
                  ),
                  Text(
                    "Skeleton Boss",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Level 2",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   color: Color(0xff697BFA),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: IdleBounce(
                builder: (ctx, child, anim) {
                  return Transform.translate(
                    offset: Offset(0.0, -10 * anim),
                    child: child,
                  );
                },
                child: const FindingMatch(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VersusScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path lowerTriangle = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();

    final Path upperTriangle = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(
      lowerTriangle,
      Paint()..color = Color(0xff697BFA),
    );

    canvas.drawPath(
      upperTriangle,
      Paint()..color = Color(0xffFE6871),
    );

    final Path heavyStroke = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(size.width / 2 - 40.0, size.height / 2 + 10.0)
      ..lineTo(size.width / 2 + 40.0, size.height / 2 - 10.0)
      ..lineTo(size.width, size.height);

    canvas.drawPath(
      heavyStroke,
      Paint()
        ..color = Color(0xff323B62)
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = 96.0,
    );
  }

  @override
  bool shouldRepaint(VersusScreenPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(VersusScreenPainter oldDelegate) => false;
}
