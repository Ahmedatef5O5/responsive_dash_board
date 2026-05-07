import 'package:finDashBoard/widgets/detailed_icome_chart.dart';
import 'package:finDashBoard/widgets/income_chart.dart';
import 'package:finDashBoard/widgets/income_details.dart';
import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class IncomeSectionBody extends StatelessWidget {
  const IncomeSectionBody({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return width >= SizeConfig.desktop && width < 1750
        ? Padding(
          padding: const EdgeInsets.all(12),
          child: DetailedIncomeChart(),
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: IncomeChart()),
            SizedBox(width: 12),
            Expanded(flex: 2, child: IncomeDetails()),
          ],
        );
  }
}
