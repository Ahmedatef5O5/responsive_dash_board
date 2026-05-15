import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/dashboard_cubit/dashboard_cubit.dart';
import '../cubits/dashboard_cubit/dashboard_state.dart';

class PeriodSelector extends StatelessWidget {
  const PeriodSelector({super.key});

  static const _periods = ['Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    final selectedPeriod = context.select<DashboardCubit, String>((cubit) {
      final s = cubit.state;
      return s is DashboardSuccess ? s.data.selectedPeriod : 'Weekly';
    });

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _periods.map((period) {
          final isSelected = period == selectedPeriod;
          return GestureDetector(
            onTap: () => context.read<DashboardCubit>().changePeriod(period),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                period,
                style: TextStyle(
                  color: isSelected
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
