import 'package:finDashBoard/core/widgets/all_expenses_header.dart';
import 'package:finDashBoard/core/widgets/all_expenses_item_list_view.dart';
import 'package:finDashBoard/core/widgets/custom_background_container.dart';
import 'package:flutter/material.dart';

class AllExpenses extends StatelessWidget {
  const AllExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Column(
        children: [
          AllExpensesHeader(),
          SizedBox(height: 16),
          Row(children: [Expanded(child: AllExpensesItemListView())]),
        ],
      ),
    );
  }
}
