import 'package:flutter/material.dart';
import 'package:responsive_dash_board/models/drawer_item_model.dart';
import 'package:responsive_dash_board/utils/app_images.dart';
import 'package:responsive_dash_board/widgets/drawer_item.dart';
import 'package:responsive_dash_board/widgets/user_info_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  static const List<DrawerItemModel> items = [
    DrawerItemModel(image: Assets.imagesDashboard, title: "DashBoard"),

    DrawerItemModel(image: Assets.imagesMyTransctions, title: "My Transaction"),

    DrawerItemModel(image: Assets.imagesStatistics, title: "Statistics"),

    DrawerItemModel(image: Assets.imagesWalletAccount, title: "Wallet Account"),

    DrawerItemModel(image: Assets.imagesMyInvestments, title: "My Investments"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          UserInfoListtile(
            image: Assets.imagesAvatar3,
            title: 'Lekan Okeowo',
            subTitle: "demo@gmail.com",
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DrawerItem(drawerItemModel: items[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
