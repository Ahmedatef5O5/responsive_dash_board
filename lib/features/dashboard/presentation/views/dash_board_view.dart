import 'package:finDashBoard/features/dashboard/presentation/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_state_widget.dart';
import '../../../../core/widgets/shimmer_loader.dart';
import '../cubits/dashboard_cubit/dashboard_state.dart';
import '../cubits/theme_cubit/cubit/theme_cubit.dart';
import '../layouts/dashboard_desktop_layout.dart';
import '../layouts/dashboard_mobile_layout.dart';
import '../layouts/dashboard_tablet_layout.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/adaptive_layout.dart';
import '../widgets/custom_drawer.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer:
          MediaQuery.sizeOf(context).width < SizeConfig.tablet
              ? SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: const CustomDrawer(),
              )
              : null,
      appBar:
          MediaQuery.of(context).size.width < SizeConfig.tablet
              ? AppBar(
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Color(0xfffafafa),
                leading: Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Icon(Icons.menu),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      context.watch<ThemeCubit>().state.isDark
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                    ),
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  ),
                  const SizedBox(width: 8),
                ],
              )
              : null,
      backgroundColor: Color(0xfff7f9fa),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading || state is DashboardInitial) {
            return const DashboardShimmerLoader();
          }
          if (state is DashboardError) {
            return ErrorStateWidget(
              message: state.message,
              onRetry: () => context.read<DashboardCubit>().loadDashboard(),
            );
          }

          return AdaptiveLayout(
            mobileLayout: (context) => const DashboardMobileLayout(),
            tabletLayout: (context) => const DashboardTabletLayout(),
            desktopLayout: (context) => const DashboardDesktopLayout(),
          );
        },
      ),
    );
  }
}
