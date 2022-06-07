import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/home/bindings/home_binding.dart';
import 'package:pocket_tomyo/app/modules/initial/controllers/initial_controller.dart';
import 'package:pocket_tomyo/app/modules/profile/bindings/profile_binding.dart';
import 'package:pocket_tomyo/app/modules/profile/views/profile_view.dart';
import 'package:pocket_tomyo/app/types/tab_types.dart';
import 'package:pocket_tomyo/generated/locales.g.dart';

import '../../home/views/home_view.dart';

class InitialView extends GetView<InitialController> {
  const InitialView({Key? key}) : super(key: key);

  // int _selectedIndex = 0;

  @override
  void initState() {
    //  init home pages depending on create
    HomeBinding().dependencies();
    ProfileBinding().dependencies();
  }

  final _screens = const [
    HomeView(),
    Center(child: Text('2nd screen')),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return
        //  GetBuilder<InitialController>(
        //   builder: (controller) =>
        Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr),
        centerTitle: true,
      ),
      body: _screens[controller.getselectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.getselectedIndex,
        onDestinationSelected: (value) {
          controller.changeIndex(value);
        },
        destinations: TabType.values
            .map((e) => NavigationDestination(
                  icon: e.icon,
                  label: e.title,
                ))
            .toList(),
      ),
    );
    // );
  }
}
