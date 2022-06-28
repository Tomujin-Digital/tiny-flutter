import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/app_constants.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';
import 'package:pocket_tomyo/app/modules/login/views/widgets/custom_app_bar.dart';

import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/buttons/filled_button.dart';

import '../../../../widgets/inputs/animated_input.dart';
import '../controllers/register_controller.dart';
import 'widgets/register_content_widget.dart';
import 'widgets/inputs.dart';

typedef void IntCallback(int val);

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
        appBar: CustomAppBar(
          currentPage: _registerController.currentPage.value,
          totalPages: RegisterController.totalPages - 1,
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
            children: [
              RegisterContentWidget(
                imageUrl: 'https://picsum.photos/id/1/200/200',
                child: nickNameInput(
                    onValidator: _registerController.validator,
                    controllerNickName: _registerController.userNameController),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TinyButton(
              onPressed: _registerController.nextPage,
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
