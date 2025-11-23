import 'package:flutter/material.dart';
import 'package:responsive_dash_board/widgets/all_expenses_and_quick_invoice_section.dart';
import 'package:responsive_dash_board/widgets/custom_dot_indicator.dart';
import 'package:responsive_dash_board/widgets/custom_drawer.dart';
import 'package:responsive_dash_board/widgets/dots_indicator.dart';
import 'package:responsive_dash_board/widgets/my_cards_page_view.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomDrawer()),
        SizedBox(width: 32),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AllExpensesAndQuickInvoiceSection(),
          ),
        ),
        SizedBox(width: 24),
        // Expanded(child: MyCardsPageView()),
        // CustomDotIndicator(isActive: false),
        DotsIndicator(),
      ],
    );
  }
}
