import 'package:finDashBoard/widgets/all_expenses.dart';
import 'package:finDashBoard/widgets/quick_invoice_widget.dart';
import 'package:flutter/material.dart';

class AllExpensesAndQuickInvoiceSection extends StatelessWidget {
  const AllExpensesAndQuickInvoiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [AllExpenses(), SizedBox(height: 24), QuickInvoice()],
      ),
    );
  }
}
