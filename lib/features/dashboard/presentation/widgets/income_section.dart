import 'package:finDashBoard/core/widgets/custom_background_container.dart';
import 'package:finDashBoard/core/widgets/income_section_body.dart';
import 'package:finDashBoard/core/widgets/income_section_header.dart';
import 'package:flutter/material.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(children: [IncomeSectionHeader(), IncomeSectionBody()]),
        ),
      ),
    );
  }
}
