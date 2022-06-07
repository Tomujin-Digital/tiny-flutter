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
  InitialView({Key? key}) : super(key: key);
  final _screens = const [
    HomeView(),
    Center(child: Text('2nd screen')),
    ProfileView(),
  ];
  final _appBars = [
    AppBar(
      title: Text('something is here'),
    ),
    null,
    null
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InitialController>(
      builder: (con) => Scaffold(
        appBar: _appBars[con.getselectedIndex],
        body: _screens[con.getselectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: con.getselectedIndex,
          onDestinationSelected: (value) {
            con.changeIndex(value);
          },
          destinations: TabType.values
              .map((e) => NavigationDestination(
                    icon: e.icon,
                    label: e.title,
                  ))
              .toList(),
        ),
      ),
    );
    // );
  }
}
