import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../controllers/programs_controller.dart';

class ProgramsView extends MainView {
  ProgramsView({Key? key}) : super(key: key);
  final programsController = Get.put(ProgramsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgramsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProgramsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
