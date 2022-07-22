import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../config/custom_colors.dart';
import '../../../../library/main_view.dart';
import '../../../../widgets/buttons/filled_button.dart';
import '../../../../widgets/inputs/animated_input.dart';

import '../controllers/login_controller.dart';
import 'register_view.dart';

class LoginView extends MainView {
  LoginView({Key? key}) : super(key: key);
  final _loginController = Get.put<LoginController>(LoginController());
  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primary,
              secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_white.png',
                  color: Colors.white,
                  height: 56.0,
                ),
                const Spacer(
                  flex: 2,
                ),
                // TinyButton(
                //   onPressed: () => Get.to(
                //     () => BattleDirectoryPage(),
                //   ),
                //   child: const Text("Battle"),
                // ),
                _buildLoginForm(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Form(
      key: _loginController.formKey,
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          AnimatedInput(
            controller: _loginController.emailController,
            errorColor: Colors.black,
            onValidator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            errorMessage: 'Enter phone number',
            label: 'Phone number',
          ),
          C.vTitleSpacing,
          Obx(
            () => TextFormField(
              obscureText: _loginController.isVisible.value,
              decoration: InputDecoration(
                errorStyle: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _loginController.toggleVisibility();
                  },
                  child: _loginController.isVisible.value
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                ),
                labelText: 'Password',
                filled: true,
              ),
              controller: _loginController.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),
          C.vElementSpacing,
          C.vElementSpacing,
          C.vElementSpacing,
          TinyButton(
            onPressed: () async {
              await _loginController.checkForm();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => _loginController.isLoading.value == true
                      ? const CupertinoActivityIndicator(color: Colors.white)
                      : const Text(
                          'Log in',
                          style: buttonStyle,
                        ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'You forgot the password?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          TinyButton(
            color: Colors.white,
            onPressed: () {
              Get.to(() => RegisterView());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Don\'t have an account?',
                ),
                C.hTitleSpacing,
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
