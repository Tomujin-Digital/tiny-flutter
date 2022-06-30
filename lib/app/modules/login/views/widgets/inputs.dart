import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/modules/0_initial/controllers/auth_controller.dart';
import 'package:pocket_tomyo/app/modules/login/controllers/register_controller.dart';
import 'package:pocket_tomyo/app/modules/login/views/widgets/register_content_widget.dart';
import 'package:pocket_tomyo/app/services/auth_repository.dart';

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
          function: (query) async {
            print(query);
            await Get.find<RegisterController>().checkUserName();
          },
          hasDebouncer: true,
          onValidator: onValidator,
          controller: controller,
          label: hint,
          errorMessage: 'Nickname is required',
        ),
      ],
    ),
  );
}

Widget nameInput(
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
        AnimatedSize(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutCubic,
          alignment: Alignment.topCenter,
          child: TextFormField(
            // todo input decoration
            decoration: InputDecoration(
              labelText: hint,
              filled: true,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
            onChanged: (value) {
              controller.text = value;
            },
            controller: controller,
            validator: (value) => onValidator(value),
          ),
        )
      ],
    ),
  );
}
