import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dash_board/models/user_info_model.dart';
import 'package:responsive_dash_board/utils/app_Styles.dart';

class UserInfoListtile extends StatelessWidget {
  const UserInfoListtile({super.key, required this.userInfoModel});
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xfffafafa),
      elevation: 0, // to clear any shadow
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(userInfoModel.image),
          title: Text(userInfoModel.title, style: AppStyles.styleBold16),
          subtitle: Text(
            userInfoModel.subTitle,
            style: AppStyles.styleRegular12,
          ),
        ),
      ),
    );
  }
}
