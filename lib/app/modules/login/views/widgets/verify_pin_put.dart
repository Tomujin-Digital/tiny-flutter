import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/app/modules/login/controllers/register_controller.dart';

class VerifyPinPut extends StatelessWidget {
  final registerController = Get.find<RegisterController>();
  VerifyPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(24),
      ),
    );

    return Column(
      children: [
        AppConstants.vTitleSpacing,
        const Text(
          'VERIFY',
          style: TextStyle(
            color: primary,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppConstants.vTitleSpacing,
        const Text(
          'We have sent an OTP on your number',
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          registerController.phoneController.text,
        ),
        AppConstants.vTitleSpacing,
        Pinput(
          length: 4,
          controller: registerController.otpVerifyController,
          // focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          inputFormatters: [],
          separator: const SizedBox(width: 16),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Resend OTP?',
              style: TextStyle(
                color: secondary,
                decoration: TextDecoration.underline,
              ),
            ))
      ],
    );
  }
}
