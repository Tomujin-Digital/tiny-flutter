import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/data/models/my_model.dart';

import '../../../services/repository.dart';

class WalletController extends GetxController {
  final _repository = Get.find<Repository>();
  final balance = 0.obs;
  @override
  void onInit() async {
    try {
      final user = await _repository.getMe();
      balance.value = user.wallet.balance;
      print(user);
    } on DioError catch (e) {
      print(e);
    }

    print('walletController : on init');
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
