import 'package:get/get.dart';

import '../../home/bindings/home_binding.dart';
import '../../profile/bindings/profile_binding.dart';

class InitialController extends GetxController {
  int _selectedIndex = 0;
  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  get getselectedIndex => _selectedIndex;
  @override
  void onInit() {
    HomeBinding().dependencies();
    ProfileBinding().dependencies();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
