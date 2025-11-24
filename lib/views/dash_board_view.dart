import 'package:flutter/material.dart';
import 'package:responsive_dash_board/layouts/dashboard_desktop_layout.dart';
import 'package:responsive_dash_board/layouts/dashboard_mobile_layout.dart';
import 'package:responsive_dash_board/layouts/dashboard_tablet_layout.dart';
import 'package:responsive_dash_board/widgets/adaptive_layout.dart';
import 'package:responsive_dash_board/widgets/custom_drawer.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.sizeOf(context).width < 800
          ? SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.7,
              child: const CustomDrawer(),
            )
          : null,
      appBar: MediaQuery.of(context).size.width < 800
          ? AppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Color(0xfffafafa),
              leading: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.menu),
                  );
                },
              ),
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
