import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../config/app_constants.dart';
import '../../../../library/main_view.dart';

import '../controllers/wallet_controller.dart';
import '../widgets/widgets.dart';

class WalletView extends MainView {
  WalletView({Key? key}) : super(key: key);
  final _walletController = Get.put<WalletController>(WalletController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: const Text(
          'My wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body:
          // _walletController.isLoading.value
          //     ? Image.asset('coin.gif')
          //     :
          Column(
        children: [
          WalletCardWidget(),
          C.vTitleSpacing,
          WalletHistoryWidget(),
        ],
      ),
    );
  }
}
