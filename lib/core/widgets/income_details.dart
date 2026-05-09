import 'package:flutter/material.dart';

import '../../features/dashboard/domain/models/item_details_model.dart';
import 'item_details.dart';

class IncomeDetails extends StatelessWidget {
  const IncomeDetails({super.key});

  static const items = [
    ItemDetailsModel(
      color: Color(0xff208bc7),
      title: 'Design service',
      value: '%40',
    ),

    ItemDetailsModel(
      color: Color(0xff4db7f2),
      title: 'Design product',
      value: '%25',
    ),

    ItemDetailsModel(
      color: Color(0xff064060),
      title: 'Product royalti',
      value: '%20',
    ),

    ItemDetailsModel(color: Color(0xffe2decd), title: 'Other', value: '%22'),
  ];
  @override
  Widget build(BuildContext context) {
    // log(MediaQuery.sizeOf(context).width.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, ((e) {
        return ItemDetails(itemDetailsModel: items[e]);
      })),
    );
  }
}
