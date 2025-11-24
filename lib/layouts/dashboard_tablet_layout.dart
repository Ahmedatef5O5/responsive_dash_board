import 'package:flutter/material.dart';
import 'package:responsive_dash_board/widgets/all_expenses_and_quick_invoice_section.dart';
import 'package:responsive_dash_board/widgets/custom_drawer.dart';
import 'package:responsive_dash_board/widgets/income_section.dart';
import 'package:responsive_dash_board/widgets/my_cards_and_transaction_history.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 32),
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AllExpensesAndQuickInvoiceSection(),
                SizedBox(height: 24),
                MyCardsAndTransactionHistory(),

                SizedBox(height: 24),
                IncomeSection(),

                SizedBox(height: 24),
              ],
            ),
          ),
        ),
        SizedBox(width: 32),
      ],
    );
  }
}
