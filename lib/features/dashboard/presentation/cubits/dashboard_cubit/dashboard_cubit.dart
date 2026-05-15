import 'package:finDashBoard/features/dashboard/domain/models/all_expenses_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/dashboard_repository_impl.dart';
import '../../../domain/models/dash_board_data.dart';
import '../../../domain/models/transaction_model.dart';
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
      final results = await Future.wait([
        _repository.getTransactions(period),
        _repository.getExpenses(period),
        _repository.getUserInfo(),
        _repository.getSummary(period),
      ]);

      final transactions = results[0] as List<TransactionModel>;
      final summary = results[3] as Map<String, double>;

      final data = DashboardData(
        selectedPeriod: period,
        transactions: transactions,
        filteredTransactions: transactions,
        expenses: results[1] as dynamic,
        userInfoItems: results[2] as dynamic,
        totalIncome: summary['income'] ?? 0,
        totalExpenses: summary['expenses'] ?? 0,
      );

      emit(DashboardSuccess(data));
    } catch (e) {
      emit(DashboardError('failed load data : ${e.toString()}'));
    }
  }

  Future<void> changePeriod(String period) async {
    final previous = _currentData;
    emit(DashboardLoading());
    try {
      final results = await Future.wait([
        _repository.getTransactions(period),
        _repository.getExpenses(period),
        _repository.getSummary(period),
      ]);

      final transactions = results[0] as List<TransactionModel>;
      final summary = results[2] as Map<String, double>;

      final data = DashboardData(
        selectedPeriod: period,
        transactions: transactions,
        filteredTransactions: transactions,
        expenses: results[1] as List<AllExpensesItemModel>,
        userInfoItems: previous?.userInfoItems ?? [],
        totalIncome: summary['income'] ?? 0,
        totalExpenses: summary['expenses'] ?? 0,
      );

      emit(DashboardSuccess(data));
    } catch (e) {
      emit(DashboardError('failed change period : ${e.toString()}'));
    }
  }

  void search(String query) {
    final data = _currentData;
    if (data == null) return;

    final filtered = _applyFilters(
      transactions: data.transactions,
      query: query,
      filter: data.activeFilter,
    );

    emit(DashboardSuccess(data.copyWith(
      searchQuery: query,
      filteredTransactions: filtered,
    )));
  }

  void applyFilter(String filter) {
    final data = _currentData;
    if (data == null) return;

    final filtered = _applyFilters(
      transactions: data.transactions,
      query: data.searchQuery,
      filter: filter,
    );

    emit(DashboardSuccess(data.copyWith(
      activeFilter: filter,
      filteredTransactions: filtered,
    )));
  }

  List<TransactionModel> _applyFilters({
    required List<TransactionModel> transactions,
    required String query,
    required String filter,
  }) {
    return transactions.where((t) {
      final matchesQuery =
          query.isEmpty || t.title.toLowerCase().contains(query.toLowerCase());

      final matchesFilter = filter == 'All' ||
          (filter == 'Income' && !t.isWithdrawal) ||
          (filter == 'Expense' && t.isWithdrawal);

      return matchesQuery && matchesFilter;
    }).toList();
  }

  DashboardData? get _currentData =>
      state is DashboardSuccess ? (state as DashboardSuccess).data : null;
}
