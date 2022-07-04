import 'package:flutter/material.dart';

import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/app_text_styles.dart';

import '../app/config/custom_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    // required this.height,

    Key? key,
  }) : super(key: key);
  // final double height;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: AppConstants.borderRadius,
      color: Colors.white,
      elevation: 3,
      child: Container(
        padding: AppConstants.padding16,
        child: Row(
          children: [
            Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: AppConstants.borderRadius,
                ),
                child: Image.asset('assets/images/tiny/head.png')),
            AppConstants.hElementSpacing,
            AppConstants.hElementSpacing,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, Ochko',
                    style: AppTextStyles.blueSubTitle,
                  ),
                  AppConstants.vElementSpacing,
                  const Text(
                    'Your daily progress',
                    style: AppTextStyles.smallGrey,
                  ),
                  AppConstants.vElementSpacing,
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: AppConstants.borderRadius,
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
            AppConstants.hElementSpacing,
            AppConstants.hElementSpacing,
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: AppConstants.borderRadius,
                border: Border.all(
                  color: grey,
                  width: 1.0,
                ),
                color: AppConstants.colorGrey2,
              ),
              child: Image.asset(
                'assets/images/tiny/crown.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
