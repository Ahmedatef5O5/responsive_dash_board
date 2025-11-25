import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/app_styles.dart';

class DetailedIncomeChart extends StatefulWidget {
  const DetailedIncomeChart({super.key});

  @override
  State<DetailedIncomeChart> createState() => _DetailedIncomeChartState();
}

class _DetailedIncomeChartState extends State<DetailedIncomeChart> {
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1, child: PieChart(getChartData()));
  }

  PieChartData getChartData() {
    return PieChartData(
      pieTouchData: PieTouchData(
        enabled: true,
        touchCallback: (p0, pieTouchResponse) {
          activeIndex =
              pieTouchResponse?.touchedSection?.touchedSectionIndex ?? -1;
          setState(() {});
        },
      ),
      centerSpaceRadius: 60,
      sectionsSpace: 0,
      sections: [
        PieChartSectionData(
          radius: activeIndex == 0 ? 50 : 40,
          value: 40,
          titlePositionPercentageOffset: activeIndex == 0 ? 1.5 : null,
          title: activeIndex == 0 ? "Design service" : '40%',
          titleStyle: AppStyles.styleMedium16(
            context,
          ).copyWith(color: activeIndex == 0 ? null : Colors.white),
          color: const Color(0xff208bc7),
        ),

        PieChartSectionData(
          radius: activeIndex == 1 ? 50 : 40,
          value: 25,
          titlePositionPercentageOffset: activeIndex == 1 ? .5 : null,
          title: activeIndex == 1 ? "Design product" : '25%',
          titleStyle: AppStyles.styleMedium16(
            context,
          ).copyWith(color: activeIndex == 1 ? null : Colors.white),
          color: const Color(0xff4db7f2),
        ),
        PieChartSectionData(
          radius: activeIndex == 2 ? 50 : 40,
          value: 20,
          titlePositionPercentageOffset: activeIndex == 2 ? 1.4 : null,
          title: activeIndex == 2 ? 'Product royalti' : '20%',
          titleStyle: AppStyles.styleMedium16(
            context,
          ).copyWith(color: activeIndex == 2 ? null : Colors.white),
          color: const Color(0xff064060),
        ),
        PieChartSectionData(
          radius: activeIndex == 3 ? 50 : 40,
          value: 22,
          titlePositionPercentageOffset: activeIndex == 3 ? 1.5 : null,
          title: activeIndex == 3 ? 'other' : '22%',
          titleStyle: AppStyles.styleMedium16(
            context,
          ).copyWith(color: activeIndex == 3 ? null : Colors.white),
          color: const Color(0xffe2decd),
        ),
      ],
    );
  }
}
