import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/dashboard/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import '../../features/dashboard/presentation/cubits/dashboard_cubit/dashboard_state.dart';
import '../utils/app_styles.dart';

class IncomeSectionHeader extends StatelessWidget {
  const IncomeSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Income', style: AppStyles.styleSemiBold20(context)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xfff1f1f1)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            children:
                ['Weekly', 'Monthly', 'Yearly'].map((period) {
                  final isSelected =
                      (context.watch<DashboardCubit>().state
                              is DashboardSuccess)
                          ? (context.read<DashboardCubit>().state
                                      as DashboardSuccess)
                                  .data
                                  .selectedPeriod ==
                              period
                          : false;

                  return Row(
                    children: [
                      Text(
                        period,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 16),
                      Transform.rotate(
                        angle: -1.57079633,
                        child: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ],
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
