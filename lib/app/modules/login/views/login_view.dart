import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/buttons/filled_button.dart';

import '../controllers/login_controller.dart';

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
                const Spacer(),
                const Spacer(),
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
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            alignment: Alignment.topCenter,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username or Email',
                filled: true,
                errorStyle: TextStyle(color: Colors.black),
              ),
              controller: _loginController.emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Нэвтрэх нэрээ оруулна уу';
                }
                return null;
              },
            ),
          ),
          AppConstants.vTitleSpacing,
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              filled: true,
            ),
            controller: _loginController.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Нэвтрэх нэрээ оруулна уу';
              }
              return null;
            },
          ),
          AppConstants.vElementSpacing,
          AppConstants.vElementSpacing,
          AppConstants.vElementSpacing,
          TinyButton(
            onPressed: () {
              _loginController.checkForm();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Log in',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text('You forgot the password?',
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
