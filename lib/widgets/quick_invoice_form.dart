import 'package:finDashBoard/widgets/custom_button.dart';
import 'package:finDashBoard/widgets/title_text_field.dart';
import 'package:flutter/material.dart';

class QuickInvoiceForm extends StatelessWidget {
  const QuickInvoiceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TitleTextField(
                title: 'Customer Name',
                hint: "Type Customer Name",
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TitleTextField(
                title: 'Customer Email',
                hint: "Type customer email",
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: TitleTextField(
                title: 'Item Name',
                hint: "Type Customer Name",
              ),
            ),
            SizedBox(width: 16),
            Expanded(child: TitleTextField(title: 'Item mount', hint: "USD")),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: CustomButton(
                btnColor: Colors.white,
                txtButton: "Add more details",
                txtColor: const Color(0xff4eb7f2),
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: CustomButton(
                btnColor: const Color(0xff4eb7f2),
                txtButton: "Send Money",
                txtColor: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
