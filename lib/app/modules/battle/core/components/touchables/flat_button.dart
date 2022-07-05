import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/modules/battle/utilities/colors.dart';
import 'package:pocket_tomyo/widgets/buttons/touchable_scale.dart';

class FilledButton extends StatelessWidget {
  const FilledButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: onPressed,
      child: Container(
        height: 54.0,
        padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 8.0),
        decoration: ShapeDecoration(
          color: kPink,
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 24.0,
              cornerSmoothing: 1.0,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          widthFactor: 1.0,
          child: DefaultTextStyle.merge(
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
