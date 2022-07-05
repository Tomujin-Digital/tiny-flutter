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
  final registerController = Get.find<RegisterController>();
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppConstants.vTitleSpacing,
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            Obx(() {
              if (registerController.isLoading.value) {
                return const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: SizedBox(
                        height: 14,
                        width: 14,
                        child: CircularProgressIndicator()),
                  ),
                );
              } else {
                if (registerController.isAvailable.value) {
                  return const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                }
              }
            }),
          ],
        ),
        const SizedBox(height: 16),
        AnimatedInput(
          function: (query) async {
            print(query);
            registerController.isLoading.value = true;

            final res =
                await Get.find<AuthRepository>().checkUserName(controller.text);
            final isAvailable = res.data['isAvailable'];
            registerController.isAvailable.value = isAvailable;
            registerController.isLoading.value = false;
            if (isAvailable) {
              return null;
            } else {
              // sabinon
              // onValidator('This username is already taken');
            }
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

Widget phoneInput({
  required String title,
}) {
  final registerController = Get.find<RegisterController>();
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
          function: (query) async {},
          hasDebouncer: false,
          controller: registerController.phoneController,
          label: 'Phone Number',
          errorMessage: 'Phone is required',
          onValidator: (String? validatorValue) {},
        ),
      ],
    ),
  );
}

Widget passWordInput(
    {required String title,
    required String anotherTitle,
    required String hint}) {
  final registerController = Get.find<RegisterController>();
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
          function: (query) async {},
          hasDebouncer: false,
          onValidator: (query) {
            if (query != null && query.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          controller: registerController.passwordController,
          label: hint,
          errorMessage: 'Password must match',
        ),
        AppConstants.vTitleSpacing,
        Text(
          anotherTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedInput(
          function: (query) async {},
          hasDebouncer: false,
          onValidator: (query) {
            if (query != null && query.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          controller: registerController.confirmPasswordController,
          label: hint,
          errorMessage: 'Password must match',
        ),
      ],
    ),
  );
}

Widget birthDate(
    {required String title,
    required dynamic Function(String?) onValidator,
    required TextEditingController controller,
    required String hint}) {
  final registerController = Get.find<RegisterController>();
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton(
              // dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              items: registerController.years
                  .map(
                    (year) => DropdownMenuItem(
                      value: year,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(year.toString()),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (int? value) {
                registerController.year.value = value ?? 1900;
              },
              value: registerController.year.value,
            ),
            DropdownButton(
              items: registerController.months
                  .map(
                    (months) => DropdownMenuItem(
                      value: months,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(months.toString()),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (int? value) {
                registerController.month.value = value ?? 1;
              },
              value: registerController.month.value,
            ),
            DropdownButton(
              items: registerController.days
                  .map(
                    (days) => DropdownMenuItem(
                      value: days,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(days.toString()),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (int? value) {
                registerController.day.value = value ?? 1;
              },
              value: registerController.day.value,
            ),
          ],
        ),

        // AnimatedInput(
        //   function: (query) async {
        //     print(query);

        //     final res =
        //         await Get.find<AuthRepository>().checkUserName(controller.text);
        //     final isAvailable = res.data['isAvailable'];
        //     registerController.isAvailable.value = isAvailable;
        //     if (isAvailable) {
        //       return null;
        //     } else {
        //       // sabinon
        //       // onValidator('This username is already taken');
        //     }
        //   },
        //   hasDebouncer: true,
        //   onValidator: onValidator,
        //   controller: controller,
        //   label: hint,
        //   errorMessage: 'Nickname is required',
        // ),
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
              errorStyle: const TextStyle(
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
