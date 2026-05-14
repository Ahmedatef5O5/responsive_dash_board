import 'package:finDashBoard/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/dashboard_state.dart';
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
              )
              : null,
      backgroundColor: Color(0xfff7f9fa),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading || state is DashboardInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DashboardError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () => context.read<DashboardCubit>().loadDashboard(),
                    child: const Text('try again'),
                  ),
                ],
              ),
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
