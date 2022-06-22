import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends MainView {
  LoginView({Key? key}) : super(key: key);
  final _loginController = Get.put<LoginController>(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo_white.png',
              color: Colors.white,
              height: 80.0,
            ),
            Text('somethig is hsre'),
            _buildLoginForm(),
          ],
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
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Нэвтрэх нэр',
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
            controller: _loginController.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Нэвтрэх нэрээ оруулна уу';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
