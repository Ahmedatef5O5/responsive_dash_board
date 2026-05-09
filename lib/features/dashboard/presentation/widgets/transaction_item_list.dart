import 'package:finDashBoard/features/dashboard/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../../domain/models/transaction_model.dart';

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
    return Column(
      children:
          items.map(((e) {
            return TransactionItem(transactionModel: e);
          })).toList(),
    );
  }
}

// another solution...
// Column(
//       children: List.generate(items.length, ((e) {
//         return TransactionItem(transactionModel: items[e]);
//       })),
//     );
 


// ListView does not match with CustomScrollView...
//  ListView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return TransactionItem(transactionModel: items[index]);
//       },
//     );