import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/all_expenses_item_model.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/widgets/all_expenses_item.dart';

class AllExpensesItemListView extends StatefulWidget {
  const AllExpensesItemListView({super.key});

  @override
  State<AllExpensesItemListView> createState() =>
      _AllExpensesItemListViewState();
}

class _AllExpensesItemListViewState extends State<AllExpensesItemListView> {
  final items = [
    const AllExpensesItemModel(
      image: Assets.imagesBalance,
      title: "Balance",
      date: "April 2022",
      price: r'$20,129',
    ),
    const AllExpensesItemModel(
      image: Assets.imagesIncome,
      title: "Income",
      date: "April 2022",
      price: r'$20,129',
    ),
    const AllExpensesItemModel(
      image: Assets.imagesExpenses,
      title: "Expenses",
      date: "April 2022",
      price: r'$20,129',
    ),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((e) {
        int index = e.key;
        var item = e.value;
        return Expanded(
          child: Container(
            // add horizontal padding to the middle item only ....
            // using Container.margin instead of padding: EdgeInsets.symmetric(horizontal: index == 1 ? 12 : 0),

            // padding: Adds space inside the widget's borders.
            // margin: Adds space outside the widget's borders (which is exactly what you want).
            margin: EdgeInsets.symmetric(horizontal: index == 1 ? 4 : 0),
            child: GestureDetector(
              onTap: () {
                if (selectedIndex != index) {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
              child: AllExpensesItem(
                itemModel: item,
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
