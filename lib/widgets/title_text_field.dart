import 'package:finDashBoard/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({super.key, required this.title, required this.hint});
  final String title, hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.styleMedium16(context)),
        SizedBox(height: 12),
        CustomTextField(hint: hint),
      ],
    );
  }
}
