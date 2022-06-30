import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/custom_colors.dart';
import '../../../../utils/shake_widget.dart';

class RegisterReward extends StatefulWidget {
  const RegisterReward({Key? key}) : super(key: key);

  @override
  State<RegisterReward> createState() => _RegisterRewardState();
}

class _RegisterRewardState extends State<RegisterReward> {
  final _shakeKey = GlobalKey<ShakeWidgetState>();

  @override
  void initState() {
    _shakeKey.currentState?.shake();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Spacer(flex: 1),
          const Text(
            'YOU WON 10,000 COINS',
            maxLines: 2,
            style: TextStyle(
                color: secondary,
                fontWeight: FontWeight.w600,
                fontSize: 28.0,
                height: 1.2),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ShakeWidget(
            key: _shakeKey,
            shakeOffset: 10,
            shakeDuration: const Duration(seconds: 1),
            child: const Image(
              image: AssetImage('assets/images/chest_open.png'),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
