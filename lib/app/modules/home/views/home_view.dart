import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_controller.dart';

class HomeView extends GetView<MainController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: const [
              Text('Home screen'),
            ],
          );
  }
}
