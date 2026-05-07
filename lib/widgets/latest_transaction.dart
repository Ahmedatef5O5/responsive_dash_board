import 'package:finDashBoard/widgets/latest_transaction_list_view.dart';
import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class LatestTransaction extends StatelessWidget {
  const LatestTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Latest Transaction', style: AppStyles.styleMedium16(context)),
        SizedBox(height: 16),

        LatestTransactionListView(),
      ],
    );
  }
}
