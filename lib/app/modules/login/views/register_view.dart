import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../library/main_view.dart';
import '../../../../widgets/buttons/filled_button.dart';
import '../../../config/custom_colors.dart';
import '../controllers/register_controller.dart';

import '../widgets/widgets.dart';

class RegisterView extends MainView {
  RegisterView({Key? key}) : super(key: key);
  final _registerController = Get.put<RegisterController>(RegisterController());

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).padding.bottom;
    var top = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;

    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _registerController.currentPage.value == 0 ||
                _registerController.currentPage.value == 6 ||
                _registerController.currentPage.value == 7
            ? null
            : CustomAppBar(
                currentPage: _registerController.currentPage.value,
                totalPages: 4,
                callback: (val) {
                  _registerController.currentPage.value = val;
                  _registerController.pageController.jumpToPage(val + 1);
                },
                height: appBarHeight,
                topPadding: top,
                preferredSize: Size.fromHeight(appBarHeight + top),
              ),
        body: Form(
          key: _registerController.registerFormKey,
          child: PageView(
            onPageChanged: (value) =>
                _registerController.currentPage.value = value,
            controller: _registerController.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const RegisterIntro(),
              RegisterContentWidget(
                imageUrl: 'name.png',
                child: registerInput(
                    title: 'Create a nickname',
                    hint: '@Nickname',
                    onValidator: _registerController.validator,
                    controller: _registerController.userNameController),
              ),
              RegisterContentWidget(
                imageUrl: 'date.png',
                child: birthDate(
                    title: 'Date of birth',
                    hint: '@Birthday',
                    onValidator: _registerController.validator,
                    controller: _registerController.birthdayController),
              ),
              RegisterContentWidget(
                imageUrl: 'password.png',
                child: Column(
                  children: [
                    passWordInput(
                        title: 'Your password',
                        hint: '********',
                        anotherTitle: 'Repeat password'),
                  ],
                ),
              ),
              RegisterContentWidget(
                imageUrl: 'phone.png',
                child: Column(
                  children: [
                    phoneInput(
                      title: 'Phone number',
                    ),
                  ],
                ),
              ),
              RegisterContentWidget(
                  imageUrl: 'verify_phone.png', child: VerifyPinPut()),
              const RegisterReward(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TinyButton(
              onPressed: _registerController.isLoading.value
                  ? () {}
                  : _registerController.onPressed,
              child: Text(
                _registerController.isLast.value ? 'Continue' : 'Next',
                style: buttonStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
