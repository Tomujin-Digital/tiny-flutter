import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/app/modules/home/controllers/home_controller.dart';

import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/post_widget.dart';

class HomeView extends MainView {
  HomeView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return homeController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PostWidget();
            },
          );
  }
}
