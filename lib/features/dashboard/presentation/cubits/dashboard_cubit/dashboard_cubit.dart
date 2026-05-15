import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/dashboard_repository_impl.dart';
import '../../../domain/models/dash_board_data.dart';
import '../../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  DashboardCubit({DashboardRepository? repository})
    : _repository = repository ?? DashboardRepositoryImpl(),
      super(DashboardInitial());

  Future<void> loadDashboard({String period = 'Weekly'}) async {
    emit(DashboardLoading());

    try {
      // Execute requests in parallel to save time

      final results = await Future.wait([
        _repository.getTransactions(period),
        _repository.getExpenses(period),
        _repository.getUserInfo(),
        _repository.getSummary(period),
      ]);

      final summary = results[3] as Map<String, double>;

      emit(
        DashboardSuccess(
          DashboardData(
            selectedPeriod: period,
            transactions: results[0] as dynamic,
            expenses: results[1] as dynamic,
            userInfoItems: results[2] as dynamic,
            totalIncome: summary['income'] ?? 0,
            totalExpenses: summary['expenses'] ?? 0,
          ),
        ),
      );
    } catch (e) {
      emit(DashboardError('failed load data : ${e.toString()}'));
    }
  }

  Future<void> changePeriod(String period) async {
    final previous =
        state is DashboardSuccess ? (state as DashboardSuccess).data : null;

    emit(DashboardLoading());

    try {
      final results = await Future.wait([
        _repository.getTransactions(period),
        _repository.getExpenses(period),
        _repository.getSummary(period),
      ]);

      final summary = results[2] as Map<String, double>;

      emit(
        DashboardSuccess(
          DashboardData(
            selectedPeriod: period,
            transactions: results[0] as dynamic,
            expenses: results[1] as dynamic,
            userInfoItems: previous?.userInfoItems ?? [],
            totalIncome: summary['income'] ?? 0,
            totalExpenses: summary['expenses'] ?? 0,
          ),
        ),
      );
    } catch (e) {
      emit(DashboardError('failed change period : ${e.toString()}'));
    }
  }
}
