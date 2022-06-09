import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/models.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

class MyApiClient {
  final Dio httpClient;

  MyApiClient({required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.data);
        List<MyModel> listMyModel = jsonResponse['data'].map<MyModel>((map) {
          return MyModel.fromJson(map);
        }).toList();
        return listMyModel;
      } else {
        print('erro -get');
      }
    } catch (_) {}
  }
}
