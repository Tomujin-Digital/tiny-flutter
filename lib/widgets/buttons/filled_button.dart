import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'touchable_scale.dart';

class UPointButton extends StatelessWidget {
  const UPointButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.contentColor,
    this.color = Colors.black,
    this.width,
    this.padding = const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
    this.height = 48.0,
    this.borderRadius = 12.0,
    this.disabled = false,
    this.shadow = true,
    this.border,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final double? width;
  final Color? contentColor;
  final void Function() onPressed;
  final double height;
  final EdgeInsets padding;
  final double borderRadius;
  final bool disabled;
  final bool shadow;
  final double? border;

  @override
  Widget build(BuildContext context) {
    Color color = disabled ? Color(0xffF3F3F7) : this.color;

    final brightness = color.computeLuminance();
    final isDark = brightness < 0.6;
    Color contentColor =
        this.contentColor ?? (isDark ? Colors.white : Colors.black);

    if (disabled) contentColor = Color(0xff9691B5);

    Widget body = AnimatedContainer(
      height: height,
      width: width,
      duration: Duration(milliseconds: 300),
      decoration: ShapeDecoration(
        color: color,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: borderRadius,
            cornerSmoothing: 0.7,
          ),
        ),
        shadows: [
          if (shadow)
            BoxShadow(
              color: color.withOpacity(disabled ? 0.0 : 0.2),
              blurRadius: 4.0,
              offset: Offset(0, 4.0),
            ),
        ],
      ),
      padding: padding,
      child: Align(
        widthFactor: 1.0,
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: contentColor,
            fontWeight: FontWeight.w500,
          ),
          child: IconTheme(
            data: Theme.of(context).iconTheme.copyWith(color: contentColor),
            child: child,
          ),
        ),
      ),
    );

    if (!disabled) body = TouchableScale(child: body, onPressed: onPressed);

    return Material(
      color: Colors.transparent,
      child: body,
    );
  }
}
