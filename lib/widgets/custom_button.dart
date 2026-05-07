import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnColor,
    required this.txtButton,
    required this.txtColor,
  });
  final Color btnColor, txtColor;
  final String txtButton;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
      ),
      onPressed: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            txtButton,
            style: AppStyles.styleSemiBold18(context).copyWith(color: txtColor),
          ),
        ),
      ),
    );
  }
}
