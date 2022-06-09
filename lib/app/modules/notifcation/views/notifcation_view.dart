import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pocket_tomyo/library/main_view.dart';

import '../controllers/notifcation_controller.dart';

class NotifcationView extends MainView {
  NotifcationView({Key? key}) : super(key: key);
  final notifcationController = Get.put(NotifcationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifcationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotifcationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
