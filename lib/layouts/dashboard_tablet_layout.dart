import 'package:finDashBoard/layouts/dashboard_mobile_layout.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 32),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: DashboardMobileLayout(),
          ),
        ),
        SizedBox(width: 32),
      ],
    );
  }
}
