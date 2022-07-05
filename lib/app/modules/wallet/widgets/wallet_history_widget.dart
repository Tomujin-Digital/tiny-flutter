import 'package:flutter/material.dart';

import 'wallet_history_item_widget.dart';

class WalletHistoryWidget extends StatelessWidget {
  const WalletHistoryWidget({Key? key}) : super(key: key);

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
        ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return WalletHistoryItemWidget();
            })
      ],
    );
  }
}
