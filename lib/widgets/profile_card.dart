import 'package:flutter/material.dart';

import '../app/config/app_constants.dart';
import '../app/config/app_text_styles.dart';

import '../app/config/custom_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    // required this.height,

    Key? key,
  }) : super(key: key);
  // final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: C.padding16,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.03),
        borderRadius: C.borderRadius,
      ),
      child: Row(
        children: [
          Container(
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: C.borderRadius,
            ),
            child: Image.asset('assets/images/tiny/head.png'),
          ),
          C.hElementSpacing,
          C.hElementSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello, Ochko',
                  style: AppTextStyles.blueSubTitle,
                ),
                C.vElementSpacing,
                const Text(
                  'Your daily progress',
                  style: AppTextStyles.smallGrey,
                ),
                C.vElementSpacing,
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: C.borderRadius,
                        child: const LinearProgressIndicator(
                          value: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          C.hElementSpacing,
          C.hElementSpacing,
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: C.borderRadius,
              border: Border.all(
                color: grey,
              ),
              color: C.colorGrey2,
            ),
            child: Image.asset(
              'assets/images/tiny/crown.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
