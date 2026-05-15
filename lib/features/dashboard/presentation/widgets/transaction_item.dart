import 'package:flutter/material.dart';
import '../../domain/models/transaction_model.dart';
import '../../../../core/utils/app_styles.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transactionModel});
  final TransactionModel transactionModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // color: const Color(0xfffafafa),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          transactionModel.title,
          style: AppStyles.styleBold16(context).copyWith(
            // color: const Color(0xff064060)
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        subtitle: Text(
          transactionModel.subTitle,
          style: AppStyles.styleRegular16(context).copyWith(
            // color: const Color(0xffaaaaaa)
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        trailing: Text(
          transactionModel.amount,
          style: AppStyles.styleSemiBold20(context).copyWith(
            color:
                transactionModel.isWithdrawal
                    ? const Color(0xfff3735e)
                    : const Color(0xff7cd87a),
          ),
        ),
      ),
    );
  }
}
