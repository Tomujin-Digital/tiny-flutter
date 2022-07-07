import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/data/models/bucket_model.dart';

Future<BucketModel> getCloths() async {
  try {
    var response =
        await Dio().get('https://elf-media.herokuapp.com/public/skin');
    return BucketModel.fromJson(response.data);
  } catch (e) {
    print(e);
    return BucketModel(count: 0, files: []);
  }
}

Future<BucketModel> getHats() async {
  try {
    var response =
        await Dio().get('https://elf-media.herokuapp.com/public/hat');
    return BucketModel.fromJson(response.data);
  } catch (e) {
    print(e);
    return BucketModel(count: 0, files: []);
  }
}

class PackageController extends GetxController {
  //TODO: Implement PackageController

  final cloth = "casual".obs;
  final hat = "default".obs;
  final active = "Cloth".obs;
  final cloths = <String>[].obs;
  final hats = <String>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    BucketModel clothss = await getCloths();
    List<String> tmp = [];
    clothss.files?.forEach((element) {
      String a = element.key!.split("/")[1].split(".")[0];
      tmp.add(a);
    });
    cloths.value = tmp;
    BucketModel hatss = await getHats();
    List<String> tmp_ = [];
    hatss.files?.forEach((element) {
      String a = element.key!.split("/")[1].split(".")[0];
      tmp_.add(a);
    });
    hats.value = tmp_;
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
