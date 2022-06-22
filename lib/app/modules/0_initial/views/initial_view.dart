import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pocket_tomyo/app/types/tab_types.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../../login/controllers/login_controller.dart';
import '../../login/views/login_view.dart';
import '../controllers/auth_controller.dart';
import '../controllers/initial_controller.dart';

///  Үндсэн хуудас
class InitialView extends MainView {
  InitialView({Key? key}) : super(key: key);
  final loginController = Get.put<LoginController>(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitialController>(
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
    );
  }
}
