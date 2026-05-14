import 'package:finDashBoard/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubit/dashboard_state.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final state = context.watch<DashboardCubit>().state;
    if (state is! DashboardSuccess) return const SizedBox();
    final transactions = state.data.transactions;

    return Column(
      children:
          transactions.map(((e) {
            return TransactionItem(transactionModel: e);
          })).toList(),
    );
  }
}
