import 'package:flutter/material.dart';
import 'package:pocket_tomyo/data/models/transaction_model.dart';

import '../../../config/app_constants.dart';
import '../../../config/custom_colors.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: grey,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Game win',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '10/10/2020',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  '+100',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ListTile(
      leading: const Icon(Icons.attach_money),
      title: Text('Transaction'),
      subtitle: Text('Date'),
      trailing: Text('\$0.00'),
    );
  }
}
