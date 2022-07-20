import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../widgets/nav_tiny.dart';

import '../../../types/tab_types.dart';
import '../../../../library/main_view.dart';
import '../../../../widgets/buttons/touchable_scale.dart';

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
                elevation: 8.0,
                destinations: TabType.values.map(
                  (e) {
                    int index = TabType.values.indexOf(e);

                    Widget body;

                    if (index == 2) {
                      body = NavBarTinyBorder(
                        child: index == con.getselectedIndex
                            ? e.tabActiveWidget
                            : e.tabWidget,
                      );
                    } else {
                      body = index == con.getselectedIndex
                          ? e.tabActiveWidget
                          : e.tabWidget;
                    }
                    return TouchableScale(
                      child: body,
                      onPressed: () {
                        con.changeIndex(index);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          )
        : LoginView());
  }
}
