import 'package:device_preview/device_preview.dart';
import 'package:finDashBoard/core/theme/app_theme.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:finDashBoard/features/dashboard/presentation/cubits/theme_cubit/theme_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
        BlocProvider(create: (_) => DashboardCubit()..loadDashboard()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
            home: DashBoardView(),
          );
        },
      ),
    );
  }
}
