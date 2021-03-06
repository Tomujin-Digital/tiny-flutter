import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'local_storage.dart';
import '../../data/models/my_model.dart';
import '../../data/models/transaction_model.dart';

import '../utils/api_http_client.dart';

class Repository extends GetxService {
  Repository() {
    print('Repository: onInit');
  }
  final _ApiHttpClient = ApiHttpClient();
  final token = ''.obs;
  @override
  void onInit() async {
    print('Repository: onInit');
    token.value =
        (await Get.find<LocalStorageService>().read(LocalStorageKey.token)) ??
            '';

    super.onInit();
  }

  Future<UserModel> getMe() async {
    try {
      final response = await _ApiHttpClient.get('/user/me',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${token.value}',
            },
          ));
      print(response);
      print(response.data);
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Transaction>> transactions() async {
    try {
      final response = await _ApiHttpClient.get('/wallet/transaction',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${token.value}',
            },
          ));
      print(response);
      print(response.data);
      final res = TransactionModel.fromJson(response.data);
      print(res);
      return res.transactions;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}
