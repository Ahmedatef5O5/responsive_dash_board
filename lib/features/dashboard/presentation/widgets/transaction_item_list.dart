import 'package:finDashBoard/features/dashboard/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubits/dashboard_cubit/dashboard_state.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/export_button.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/filter_chip_row.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/period_selector.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/search_bar_widget.dart';
import 'package:finDashBoard/features/dashboard/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/empty_state_widget.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PeriodSelector(),
        const SizedBox(height: 16),
        Row(children: [
          const Expanded(child: DashboardSearchBar()),
          const SizedBox(width: 8),
          const ExportButton(),
        ]),
        const SizedBox(height: 12),
        const FilterChipRow(),
        const SizedBox(height: 16),
        BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is! DashboardSuccess) return const SizedBox.shrink();

            final transactions = state.data.filteredTransactions;

            if (transactions.isEmpty) {
              return const EmptyStateWidget(
                message: 'No transactions match your search',
                icon: Icons.search_off_rounded,
              );
            }

            return Column(
              children: transactions
                  .map((e) => TransactionItem(transactionModel: e))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
