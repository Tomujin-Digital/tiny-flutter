import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/app_text_styles.dart';
import 'package:pocket_tomyo/widgets/character_widget.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    required this.height,
    this.horizontalMargin,
    this.verticalMargin,
    Key? key,
  }) : super(key: key);
  final double height;
  final double? horizontalMargin;
  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppConstants.padding168,
      child: PhysicalModel(
        borderRadius: AppConstants.borderRadius,
        color: Colors.white,
        elevation: 3,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: AppConstants.padding16,
          height: height,
          child: Row(
            children: [
              CharacterWidget(height: height / 2),
              AppConstants.hElementSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hello, Ochko',
                      style: AppTextStyles.blueSubTitle,
                    ),
                    const Text(
                      'Your daily progress',
                      style: AppTextStyles.smallGrey,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: AppConstants.borderRadius,
                              child: SizedBox(
                                width: Get.width / 9 * 4,
                                height: 14.0,
                                child: const LinearProgressIndicator(
                                  value: 0.5,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppConstants.hElementSpacing,
              Stack(
                children: [
                  Image.network('https://via.placeholder.com/150'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
