import 'package:get/get.dart';

class InitialController extends GetxController {
  //TODO: Implement InitialController

  final selectedIndex = 0.obs;

  setselectedIndex(int value) => selectedIndex.value = value;
  getselectedIndex() => selectedIndex.value;
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
