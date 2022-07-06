import 'package:get/get.dart';

class PackageController extends GetxController {
  //TODO: Implement PackageController

  final cloth = "casual".obs;
  final hat = "1".obs;
  final active = "Cloth".obs;
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

  void setCloth(String val) => cloth.value = val;
  void setHat(String val) => hat.value = val;
  void setActive(String val) => active.value = val;
}
