import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pocket_tomyo/library/main_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends MainView {
  ProfileView({Key? key}) : super(key: key);
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text('Profile screen')],
    );
  }
}
