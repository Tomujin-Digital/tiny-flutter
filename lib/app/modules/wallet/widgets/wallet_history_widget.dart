import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';
import 'transaction_card.dart';

class WalletHistoryWidget extends StatelessWidget {
  WalletHistoryWidget({Key? key}) : super(key: key);
  final controller = Get.put<WalletController>(WalletController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              TextButton(
                child: Text('See all'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.transactions.length,
            itemBuilder: (context, index) {
              print(controller.transactions.length);
              return TransactionCard(
                transaction: controller.transactions[index],
              );
            },
          ),
        )
      ],
    );
  }
}
