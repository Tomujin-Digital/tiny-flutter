import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../library/main_view.dart';
import '../controllers/newsfeed_controller.dart';
import '../widgets/widgets.dart';

class NewsFeedView extends MainView {
  NewsFeedView({Key? key}) : super(key: key);
  final homeController = Get.put(NewsFeedController());
  @override
  Widget build(BuildContext context) {
    return homeController.isLoading.value
        ? MainView.isLoading()
        : ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PostWidget();
            },
          );
  }
}
