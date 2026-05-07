import 'package:flutter/material.dart';
import '../widgets/all_expenses_and_quick_invoice_section.dart';
import '../widgets/income_section.dart';
import '../widgets/my_cards_and_transaction_history.dart';

class DashboardMobileLayout extends StatelessWidget {
  const DashboardMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
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
      ],
    );
  }
}
