import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });
  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOut,
      child: LayoutBuilder(
        key: const ValueKey('dashboard_content'),
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return mobileLayout(context);
          } else if (constraints.maxWidth < 1300) {
            return tabletLayout(context);
          } else {
            return desktopLayout(context);
          }
        },
      ),
    );
  }
}
