import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
      centerSpaceRadius: 80,
      sectionsSpace: 0,
      sections: [
        PieChartSectionData(
          showTitle: false,
          radius: activeIndex == 0 ? 50 : 40,
          value: 40,
          color: const Color(0xff208bc7),
        ),

        PieChartSectionData(
          showTitle: false,
          radius: activeIndex == 1 ? 50 : 40,
          value: 25,
          color: const Color(0xff4db7f2),
        ),
        PieChartSectionData(
          showTitle: false,
          radius: activeIndex == 2 ? 50 : 40,
          value: 20,
          color: const Color(0xff064060),
        ),
        PieChartSectionData(
          showTitle: false,
          radius: activeIndex == 3 ? 50 : 40,
          value: 22,
          color: const Color(0xffe2decd),
        ),
      ],
    );
  }
}
