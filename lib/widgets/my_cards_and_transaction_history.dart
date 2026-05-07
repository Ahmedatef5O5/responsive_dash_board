import 'package:finDashBoard/widgets/custom_background_container.dart';
import 'package:finDashBoard/widgets/my_cards_section.dart';
import 'package:finDashBoard/widgets/transaction_history.dart';
import 'package:flutter/material.dart';

class MyCardsAndTransactionHistory extends StatelessWidget {
  const MyCardsAndTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackgroundContainer(
      child: Column(
        children: [
          MyCardsSection(),
          Divider(height: 40, color: Color(0xfff1f1f1)),
          TransactionHistory(),
        ],
      ),
    );
  }
}
