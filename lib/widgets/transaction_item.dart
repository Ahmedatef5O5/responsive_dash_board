import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/transaction_model.dart';
import 'package:responsive_dash_board/utils/app_Styles.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transactionModel});
  final TransactionModel transactionModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xfffafafa),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        title: Text(
          transactionModel.title,
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: const Color(0xff064060)),
        ),
        subtitle: Text(
          transactionModel.subTitle,
          style: AppStyles.styleRegular16(
            context,
          ).copyWith(color: const Color(0xffaaaaaa)),
        ),
        trailing: Text(
          transactionModel.amount,
          style: AppStyles.styleSemiBold20(context).copyWith(
            color: transactionModel.isWithdrawal
                ? const Color(0xfff3735e)
                : const Color(0xff7cd87a),
          ),
        ),
      ),
    );
  }
}
