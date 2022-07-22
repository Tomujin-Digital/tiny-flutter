import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../library/main_view.dart';
import '../../../types/notifcation_types.dart';
import '../controllers/notifcation_controller.dart';
import '../widgets/widgets.dart';

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
