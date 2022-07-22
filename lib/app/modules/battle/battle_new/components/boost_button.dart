import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../widgets/buttons/touchable_scale.dart';

import '../../core/components/animations/i_zoom.dart';
import '../battle_controller.dart';

/// [type] is either 1, 2, 3.
class BoostButton extends StatefulWidget {
  const BoostButton({
    Key? key,
    required this.type,
    required this.boostCtrl,
  }) : super(key: key);

  final SingleBoostController boostCtrl;
  final int type;

  @override
  State<BoostButton> createState() => _BoostButtonState();
}

class _BoostButtonState extends State<BoostButton>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  double _progress = 0.0;

  @override
  void initState() {
    _ticker = createTicker(_onTick)..start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  void _onTick(Duration duration) {
    if (widget.boostCtrl.cooldownProgress != _progress) {
      setState(() {
        _progress = widget.boostCtrl.cooldownProgress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: () => widget.boostCtrl.use(),
      child: AnimatedContainer(
        height: 64.0,
        width: 64.0,
        duration: const Duration(milliseconds: 850),
        curve: Curves.easeInOutCubicEmphasized,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: widget.boostCtrl.isAvailable ? 4 : 0,
            color: widget.boostCtrl.isAvailable
                ? Colors.white
                : Colors.white.withAlpha(0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.yellow
                  .withOpacity(widget.boostCtrl.isAvailable ? 0.2 : 0.0),
              blurRadius: 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomPaint(
              foregroundPainter: BoostCooldownPainter(
                progress: _progress,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/png/IconGroup_SkillIcon_${widget.type}.png',
                ),
              ),
            ),
            if (!widget.boostCtrl.isAvailable)
              Center(
                child: IZoom(
                  key: ValueKey(
                      '${widget.boostCtrl.cooldownRemainingInSeconds}'),
                  child: Text(
                    '${widget.boostCtrl.cooldownRemainingInSeconds}',
                    style: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(blurRadius: 2.0),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BoostCooldownPainter extends CustomPainter {
  const BoostCooldownPainter({
    required this.progress,
  });

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..strokeWidth = 6.0;

    final Path pie = Path()
      ..moveTo(size.width / 2, 0.0)
      ..arcTo(
        Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        -math.pi / 2,
        (math.pi * 2) * progress,
        false,
      )
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width / 2, 0.0)
      ..close();

    canvas.drawPath(pie, paint);
  }

  @override
  bool shouldRepaint(BoostCooldownPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BoostCooldownPainter oldDelegate) => false;
}
