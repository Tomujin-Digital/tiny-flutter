import 'package:flutter/material.dart';

import '../app/config/app_text_styles.dart';

/// This [Widget] is uset to Display subTitle in the page
class SubTitleWidget extends StatelessWidget {
  /// Title name to display
  final String titleName;

  /// backButton name
  final String textButtonName;

  /// onTap function to call when the backButtonName is pressed
  final void Function()? onTap;

  /// leftPadding to add to the left side of the widget
  /// This is optional
  /// default value is 0
  final double? leftPadding;

  const SubTitleWidget({
    super.key,
    required this.titleName,
    required this.textButtonName,
    this.leftPadding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding ?? 0),
      child: Row(
        children: [
          Text(
            titleName,
            style: AppTextStyles.title,
          ),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(
              textButtonName,
              style: AppTextStyles.smallPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
