import 'package:flutter/material.dart';
import 'package:responsive_dash_board/layouts/dashboard_desktop_layout.dart';
import 'package:responsive_dash_board/layouts/dashboard_mobile_layout.dart';
import 'package:responsive_dash_board/layouts/dashboard_tablet_layout.dart';
import 'package:responsive_dash_board/widgets/adaptive_layout.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).size.width < 800
          ? AppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Color(0xfffafafa),
              leading: Icon(Icons.menu),
            )
          : null,
      backgroundColor: Color(0xfff7f9fa),
      body: AdaptiveLayout(
        mobileLayout: (context) => const DashboardMobileLayout(),
        tabletLayout: (context) => const DashboardTabletLayout(),
        desktopLayout: (context) => const DashboardDesktopLayout(),
      ),
    );
  }
}
