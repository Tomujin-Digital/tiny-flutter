import 'package:flutter/material.dart';
import '../../../../widgets/buttons/touchable_scale.dart';

import '../../../config/app_constants.dart';

class BattleCardWidget extends StatelessWidget {
  final bool isLocked;
  final String title;
  final String imagePath;
  final void Function()? onPressed;

  const BattleCardWidget({
    super.key,
    required this.isLocked,
    required this.imagePath,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableScale(
      onPressed: onPressed,
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              color: Colors.amber,
              borderRadius: C.borderRadius,
            ),
          ),
          isLocked
              ? Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                )
              : const SizedBox(),
          Positioned.fill(
            top: -40,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
          ),
          isLocked
              ? Positioned.fill(
                  top: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/lock.png'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
