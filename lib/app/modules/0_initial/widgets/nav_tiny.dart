import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../../../config/custom_colors.dart';

class NavBarTinyBorder extends StatelessWidget {
  const NavBarTinyBorder({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NavBarTinyBorderPainter(),
      child: Center(
        child: child,
      ),
    );
  }
}

class NavBarTinyBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width - 16.0;
    final height = size.height - 16.0;

    final Path path = SmoothBorderRadius(
      cornerRadius: 16.0,
      cornerSmoothing: 1.0,
    ).toPath(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: width,
        height: height,
      ),
    );

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: width,
        height: height,
      ),
      const Radius.circular(12),
    );

    // Draw border
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..shader = const LinearGradient(colors: [primary, secondary])
            .createShader(rrect.outerRect),
    );
  }

  @override
  bool shouldRepaint(NavBarTinyBorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NavBarTinyBorderPainter oldDelegate) => false;
}
