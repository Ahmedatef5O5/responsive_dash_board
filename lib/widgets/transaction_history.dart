import 'package:finDashBoard/widgets/transaction_history_header.dart';
import 'package:finDashBoard/widgets/transaction_item_list.dart';
import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionHistoryHeader(),
        SizedBox(height: 20),
        Text(
          '13 April 2022',
          style: AppStyles.styleMedium16(
            context,
          ).copyWith(color: Color(0xffaaaaaa)),
        ),
        SizedBox(height: 16),
        TransactionItemList(),
      ],
    );
  }
}
