import 'package:flutter/material.dart';

import '../../../../config/custom_colors.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: const [
          Spacer(flex: 1),
          Text(
            'Take 4 steps and get 10,000 coins',
            style: TextStyle(
              color: secondary,
              fontWeight: FontWeight.w600,
              fontSize: 32.0,
            ),
          ),
          SizedBox(height: 40),
          Placeholder(
            fallbackHeight: 200,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
