import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';

import '../../../../../widgets/inputs/animated_input.dart';

Widget registerInput(
    {required String title,
    required dynamic Function(String?) onValidator,
    required TextEditingController controller,
    required String hint}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.vTitleSpacing,
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInput(
          onValidator: onValidator,
          controller: controller,
          label: hint,
          errorMessage: 'Nickname is required',
        ),
      ],
    ),
  );
}
