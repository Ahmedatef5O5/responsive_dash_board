import 'package:finDashBoard/core/widgets/custom_background_container.dart';
import 'package:finDashBoard/core/widgets/latest_transaction.dart';
import 'package:finDashBoard/core/widgets/quick_invoice_form.dart';
import 'package:finDashBoard/core/widgets/quick_invoice_header.dart';
import 'package:flutter/material.dart';

class QuickInvoice extends StatelessWidget {
  const QuickInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuickInvoiceHeader(),
          SizedBox(height: 24),
          LatestTransaction(),
          Divider(height: 48, color: Color(0xfff1f1f1)),
          QuickInvoiceForm(),
        ],
      ),
    );
  }
}
