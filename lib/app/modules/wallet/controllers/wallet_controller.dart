import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pocket_tomyo/data/models/my_model.dart';
import 'package:pocket_tomyo/data/models/transaction_model.dart';

import '../../../services/repository.dart';

class WalletController extends GetxController {
  final _repository = Get.find<Repository>();
  final isLoading = false.obs;
  final balance = 0.obs;
  final transactions = <Transaction>[].obs;
  @override
  void onInit() async {
    try {
      isLoading.value = true;
      final user = await _repository.getMe();

      balance.value = user.wallet.balance;
      transactions.value = await _repository.transactions();
      isLoading.value = false;
      print(user);
    } on DioError catch (e) {
      isLoading.value = false;
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
