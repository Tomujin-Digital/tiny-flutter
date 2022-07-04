import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/config/custom_colors.dart';

import 'package:pocket_tomyo/app/types/tab_types.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../../login/controllers/login_controller.dart';
import '../../login/views/login_view.dart';
import '../controllers/auth_controller.dart';
import '../controllers/initial_controller.dart';

///  Үндсэн хуудас
class InitialView extends MainView {
  InitialView({Key? key}) : super(key: key);
  // final authController = Get.find<AuthController>();
  final authController = Get.put<AuthController>(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => authController.status.value == AuthStatus.loggedIn
        ? GetBuilder<InitialController>(
            builder: (con) => Scaffold(
              /// Сонгогдсон хуудас харагдах [TabBar]
              body: con.getSelectedPage,

              /// [NavigationBar] хэсгийг хэрэгжүүлэлт
              bottomNavigationBar: NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                backgroundColor: Colors.white,
                selectedIndex: con.getselectedIndex,
                onDestinationSelected: (value) {
                  con.changeIndex(value);
                },
                destinations: TabType.values.map(
                  (e) {
                    int index = TabType.values.indexOf(e);
                    if (index == 2) {
                      return Container(
                        padding: const EdgeInsets.all(1),
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                              colors: [primary, secondary]),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 10,
                              cornerSmoothing: 0.7,
                            ),
                          ),
                        ),
                        child: Container(
                          // margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: NavigationDestination(
                            icon: index == con.getselectedIndex
                                ? e.tabActiveWidget
                                : e.tabWidget,
                            label: '',
                          ),
                        ),
                      );
                    }
                    return NavigationDestination(
                      icon: index == con.getselectedIndex
                          ? e.tabActiveWidget
                          : e.tabWidget,
                      label: '',
                    );
                  },
                ).toList(),
              ),
            ),
          )
        : LoginView());
  }
}
