import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';

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
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(colors: [primary, secondary]),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 10,
              cornerSmoothing: 0.7,
            ),
          ),
        ),
        child: Container(
          // margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: child,
        ),
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
      Radius.circular(12),
    );

    // Draw border
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..shader = LinearGradient(colors: [primary, secondary])
            .createShader(rrect.outerRect),
    );

    //
    // canvas.drawRRect(
    //   rrect,
    //   Paint()
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = 2
    //     ..shader = LinearGradient(colors: [primary, secondary])
    //         .createShader(rrect.outerRect),
    // );
  }

  @override
  bool shouldRepaint(NavBarTinyBorderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NavBarTinyBorderPainter oldDelegate) => false;
}
