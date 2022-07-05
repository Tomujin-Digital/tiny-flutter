import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/app/modules/login/controllers/register_controller.dart';
import 'package:pocket_tomyo/app/services/auth_repository.dart';

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
        C.vTitleSpacing,
        const Text(
          'VERIFY',
          style: TextStyle(
            color: primary,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        C.vTitleSpacing,
        const Text(
          'We have sent an OTP on your number',
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          registerController.phoneController.text,
        ),
        C.vTitleSpacing,
        Pinput(
          length: 6,
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
            onPressed: () async {
              try {
                await Get.find<AuthRepository>()
                    .sendOtp(registerController.phoneController.text);
              } on DioError catch (e) {
                print(e.response?.data['message']);
                Get.snackbar(
                  'Error',
                  e.response?.data['message'],
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              } on Error catch (e) {
                print(e);
              }
            },
            child: const Text(
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
