import 'package:get/get.dart';

class InitialController extends GetxController {
  int _selectedIndex = 0;
  void changeIndex(int index) {
    _selectedIndex = index;
    update();
  }

  get getselectedIndex => _selectedIndex;
  @override
  void onInit() {
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