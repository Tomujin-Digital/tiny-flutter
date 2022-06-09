import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:pocket_tomyo/app/types/tab_types.dart';

import '../controllers/initial_controller.dart';

///  Үндсэн хуудас
class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

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
