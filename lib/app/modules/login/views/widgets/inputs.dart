import 'package:flutter/material.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';

import '../../../../../widgets/inputs/animated_input.dart';

Widget nickNameInput(
    {required dynamic Function(String?) onValidator,
    required TextEditingController controllerNickName}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.vTitleSpacing,
        const Text(
          'Create username',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInput(
            onValidator: onValidator,
            controller: controllerNickName,
            label: '@Nickname',
            errorMessage: 'Nickname is required'),
      ],
    ),
  );
}
