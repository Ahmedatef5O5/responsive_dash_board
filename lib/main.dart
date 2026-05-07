import 'package:device_preview/device_preview.dart';
import 'package:finDashBoard/views/dash_board_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const FinDashApp()),
  );
}

class FinDashApp extends StatelessWidget {
  const FinDashApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: DashBoardView(),
    );
  }
}
