import 'dart:typed_data';
import 'package:csv/csv.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:finDashBoard/features/dashboard/domain/models/transaction_model.dart';

class ExportService {
  static Future<void> exportToCsv(List<TransactionModel> transactions) async {
    final rows = [
      ['Title', 'Date', 'Amount', 'Type'], // Header
      ...transactions.map((t) => [
            t.title,
            t.subTitle,
            t.amount,
            t.isWithdrawal ? 'Expense' : 'Income',
          ]),
    ];

    final csv = const ListToCsvConverter().convert(rows);
    final bytes = Uint8List.fromList(csv.codeUnits);

    await Share.shareXFiles(
      [XFile.fromData(bytes, mimeType: 'text/csv', name: 'transactions.csv')],
      subject: 'Dashboard Transactions',
    );
  }

  static Future<void> exportToPdf(
    List<TransactionModel> transactions,
    String period,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (context) => [
          // Header
          pw.Header(
            level: 0,
            child: pw.Text(
              'Financial Dashboard — $period Report',
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(height: 16),

          // Summary
          pw.Text(
            'Generated: ${DateTime.now().toString().substring(0, 10)}',
            style: const pw.TextStyle(color: PdfColors.grey),
          ),
          pw.SizedBox(height: 24),

          // Table
          pw.TableHelper.fromTextArray(
            headers: ['Title', 'Date', 'Amount', 'Type'],
            data: transactions
                .map((t) => [
                      t.title,
                      t.subTitle,
                      t.amount,
                      t.isWithdrawal ? 'Expense' : 'Income',
                    ])
                .toList(),
            headerStyle: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
            headerDecoration: const pw.BoxDecoration(
              color: PdfColors.blueGrey800,
            ),
            rowDecoration: const pw.BoxDecoration(
              color: PdfColors.grey100,
            ),
            cellAlignments: {
              0: pw.Alignment.centerLeft,
              1: pw.Alignment.center,
              2: pw.Alignment.center,
              3: pw.Alignment.center,
            },
          ),
        ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (_) async => pdf.save(),
      name: 'dashboard_report_$period.pdf',
    );
  }
}
