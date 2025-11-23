import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/transaction_model.dart';
import 'package:responsive_dash_board/widgets/transaction_item.dart';

class TransactionItemList extends StatelessWidget {
  const TransactionItemList({super.key});
  static const items = [
    TransactionModel(
      title: 'Cash Withdrawal',
      subTitle: '12 Apr, 2022 ',
      amount: r'$20,129',
      isWithdrawal: true,
    ),

    TransactionModel(
      title: 'Landing Page Project',
      subTitle: '12 Apr, 2022 ',
      amount: r'$20,129',
      isWithdrawal: false,
    ),
    TransactionModel(
      title: 'Juni Mobile App Project',
      subTitle: '12 Apr, 2022 ',
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
