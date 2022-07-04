import 'package:flutter/material.dart';

import '../../app/config/custom_colors.dart';
import 'touchable_scale.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: grey1,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
