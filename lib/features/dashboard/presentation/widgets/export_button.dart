import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finDashBoard/core/utils/export_service.dart';
import '../cubits/dashboard_cubit/dashboard_cubit.dart';
import '../cubits/dashboard_cubit/dashboard_state.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.download_rounded),
      tooltip: 'Export Data',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (format) async {
        final state = context.read<DashboardCubit>().state;
        if (state is! DashboardSuccess) return;

        final transactions = state.data.filteredTransactions;
        final period = state.data.selectedPeriod;

        if (format == 'csv') {
          await ExportService.exportToCsv(
            transactions.cast(),
          );
        } else {
          await ExportService.exportToPdf(
            transactions.cast(),
            period,
          );
        }
      },
      itemBuilder: (_) => [
        const PopupMenuItem(
          value: 'csv',
          child: Row(children: [
            Icon(Icons.table_chart_outlined),
            SizedBox(width: 12),
            Text('Export as CSV'),
          ]),
        ),
        const PopupMenuItem(
          value: 'pdf',
          child: Row(children: [
            Icon(Icons.picture_as_pdf_outlined),
            SizedBox(width: 12),
            Text('Export as PDF'),
          ]),
        ),
      ],
    );
  }
}
