import 'package:finDashBoard/widgets/user_info_list_tile.dart';
import 'package:flutter/material.dart';

import '../models/user_info_model.dart';
import '../utils/app_images.dart';

class LatestTransactionListView extends StatelessWidget {
  const LatestTransactionListView({super.key});
  static const items = [
    UserInfoModel(
      image: Assets.imagesAvatar1,
      title: 'Madrani Andi',
      subTitle: 'Madraniadi20@gmail',
    ),
    UserInfoModel(
      image: Assets.imagesAvatar2,
      title: 'Madrani Andi',
      subTitle: 'Madraniadi20@gmail',
    ),
    UserInfoModel(
      image: Assets.imagesAvatar3,
      title: 'Madrani Andi',
      subTitle: 'Madraniadi20@gmail',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            items
                .map(
                  ((e) => IntrinsicWidth(
                    child: UserInfoListtile(userInfoModel: e),
                  )),
                )
                .toList(),
      ),
    );

    // another option by guess what for height !
    // SizedBox(
    //   height: 80,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: items.length,
    //     itemBuilder: (context, index) {
    //       return IntrinsicWidth(
    //         child: UserInfoListtile(userInfoModel: items[index]),
    //       );
    //     },
    //   ),
    // );
  }
}
