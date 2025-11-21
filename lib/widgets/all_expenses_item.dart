import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/all_expenses_item_model.dart';
import 'package:responsive_dash_board/widgets/all_expenses_item_header.dart';

class AllExpensesItem extends StatelessWidget {
  const AllExpensesItem({super.key, required this.itemModel});
  final AllExpensesItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xfff1f1f1)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      child: Column(children: [AllExpensesItemHeader(image: itemModel.image)]),
    );
  }
}
