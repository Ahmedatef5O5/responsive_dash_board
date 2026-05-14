import 'package:device_preview/device_preview.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:finDashBoard/features/dashboard/presentation/views/dash_board_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const FinDashApp()),
  );
}

class FinDashApp extends StatelessWidget {
  const FinDashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()..loadDashboard(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: DashBoardView(),
      ),
    );
  }
}
