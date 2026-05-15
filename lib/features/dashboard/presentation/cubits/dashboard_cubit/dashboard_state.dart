import '../../../domain/models/dash_board_data.dart';

sealed class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final DashboardData data;
  DashboardSuccess(this.data);
}

class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}
