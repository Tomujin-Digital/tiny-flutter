import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/types/tab_types.dart';
import 'package:pocket_tomyo/generated/locales.g.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr),
        centerTitle: true,
      ),
      body: Text(''),
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.getselectedIndex(),
        onDestinationSelected: (value) =>
            GetX(builder: (context) => controller.setselectedIndex(value)),
        destinations: TabType.values
            .map((e) => NavigationDestination(
                  icon: e.icon,
                  label: e.title,
                ))
            .toList(),
      ),
    );
  }
}
