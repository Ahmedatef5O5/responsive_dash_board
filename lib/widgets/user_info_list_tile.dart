import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dash_board/utils/app_Styles.dart';

class UserInfoListtile extends StatelessWidget {
  const UserInfoListtile({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(title, style: AppStyles.styleBold16),
      subtitle: Text(subTitle, style: AppStyles.styleRegular12),
    );
  }
}
