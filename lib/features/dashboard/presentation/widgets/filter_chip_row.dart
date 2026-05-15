import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/dashboard_cubit/dashboard_cubit.dart';
import '../cubits/dashboard_cubit/dashboard_state.dart';

class FilterChipRow extends StatelessWidget {
  const FilterChipRow({super.key});

  static const _filters = ['All', 'Income', 'Expense'];

  @override
  Widget build(BuildContext context) {
    final activeFilter = context.select<DashboardCubit, String>((cubit) {
      final s = cubit.state;
      return s is DashboardSuccess ? s.data.activeFilter : 'All';
    });

    return Row(
      children: _filters.map((filter) {
        final isActive = filter == activeFilter;

        final color = switch (filter) {
          'Income' => const Color(0xff7cd87a),
          'Expense' => const Color(0xfff3735e),
          _ => Theme.of(context).colorScheme.primary,
        };

        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FilterChip(
            label: Text(filter),
            selected: isActive,
            onSelected: (_) =>
                context.read<DashboardCubit>().applyFilter(filter),
            selectedColor: color.withValues(alpha: 0.2),
            checkmarkColor: color,
            labelStyle: TextStyle(
              color: isActive ? color : null,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
            side: BorderSide(
              color: isActive ? color : Colors.grey.shade300,
            ),
          ),
        );
      }).toList(),
    );
  }
}
