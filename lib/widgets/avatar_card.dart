import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/app_text_styles.dart';
import 'package:pocket_tomyo/widgets/character_widget.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    required this.height,
    this.horizontalMargin,
    this.verticalMargin,
    Key? key,
  })  : assert(height != null),
        super(key: key);
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
        child: Container(
          padding: AppConstants.padding168,
          height: height,
          child: Row(
            children: [
              CharacterWidget(height: height / 2),
              AppConstants.hElementSpacing,
              Column(
                children: [
                  Text(
                    'Hello, Ochko',
                    style: AppTextStyles.cardTitle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
