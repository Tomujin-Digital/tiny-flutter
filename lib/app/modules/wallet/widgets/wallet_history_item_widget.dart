import 'package:flutter/material.dart';

class WalletHistoryItemWidget extends StatelessWidget {
  const WalletHistoryItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.attach_money),
      title: Text('Transaction'),
      subtitle: Text('Date'),
      trailing: Text('\$0.00'),
    );
  }
}
