import 'package:flutter/material.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/widgets/all_expenses_item_header.dart';

class AllExpensesItem extends StatelessWidget {
  const AllExpensesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [AllExpensesItemHeader(image: Assets.imagesIncome)],
    );
  }
}
