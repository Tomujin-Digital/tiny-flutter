import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/app/types/notifcation_types.dart';

import 'package:pocket_tomyo/library/main_view.dart';
import 'package:pocket_tomyo/widgets/notifcation_widget.dart';

import '../controllers/notifcation_controller.dart';

class NotifcationView extends MainView {
  NotifcationView({Key? key}) : super(key: key);
  final notifcationController = Get.put(NotifcationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          /// TODO: notifcation list
          return const NotifcationWidget(
            imageUrl: 'https://picsum.photos/200',
            message: 'started following you',
            time: ' 10:00 ',
            title: 'Bataa',
            type: NotifcationTypes.rank,
          );
        },
      ),
    );
  }
}
