import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/transaction_model.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';
import 'package:responsive_dash_board/widgets/transaction_history_header.dart';
import 'package:responsive_dash_board/widgets/transaction_item.dart';

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
          style: AppStyles.styleMedium16.copyWith(color: Color(0xffaaaaaa)),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TransactionItemList(),
          ),
        ),
      ],
    );
  }
}

class TransactionItemList extends StatelessWidget {
  const TransactionItemList({super.key});
  static const items = [
    TransactionModel(
      title: 'Cash Withdrawal',
      date: '12 Apr, 2022 ',
      amount: r'$20,129',
      isWithdrawal: true,
    ),

    TransactionModel(
      title: 'Landing Page Project',
      date: '12 Apr, 2022 ',
      amount: r'$20,129',
      isWithdrawal: false,
    ),
    TransactionModel(
      title: 'Juni Mobile App Project',
      date: '12 Apr, 2022 ',
      amount: r'$20,129',
      isWithdrawal: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TransactionItem(transactionModel: items[index]);
      },
    );
  }
}

// another solution...
// Column(
//       children: List.generate(items.length, ((e) {
//         return TransactionItem(transactionModel: items[e]);
//       })),
//     );
