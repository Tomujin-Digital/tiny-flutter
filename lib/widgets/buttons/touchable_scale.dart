import 'package:flutter/material.dart';

class TouchableScale extends StatefulWidget {
  const TouchableScale({Key? key, required this.child, this.onPressed})
      : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  @override
  _TouchableScaleState createState() => _TouchableScaleState();
}

class _TouchableScaleState extends State<TouchableScale>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(TouchableScale old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = 0.92;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!isDown) {
      isDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (isDown) {
      isDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (isDown) {
      isDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = isDown;
    final TickerFuture ticker = isDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != isDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, _) {
            return Transform.scale(
              scale: _opacityAnimation.value,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}
