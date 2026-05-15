import 'package:finDashBoard/features/dashboard/domain/models/all_expenses_item_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/transaction_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/user_info_model.dart';

class DashboardData {
  final List<TransactionModel> transactions;
  final List<TransactionModel> filteredTransactions;

  final List<AllExpensesItemModel> expenses;
  final List<UserInfoModel> userInfoItems;
  final double totalIncome;
  final double totalExpenses;
  final String selectedPeriod;
  final String searchQuery;
  final String activeFilter;

  const DashboardData({
    required this.transactions,
    required this.filteredTransactions,
    required this.expenses,
    required this.userInfoItems,
    required this.totalIncome,
    required this.totalExpenses,
    required this.selectedPeriod,
    this.searchQuery = '',
    this.activeFilter = 'All',
  });

  DashboardData copyWith({
    List<TransactionModel>? transactions,
    List<TransactionModel>? filteredTransactions,
    List<AllExpensesItemModel>? expenses,
    List<UserInfoModel>? userInfoItems,
    double? totalIncome,
    double? totalExpenses,
    String? selectedPeriod,
    String? searchQuery,
    String? activeFilter,
  }) {
    return DashboardData(
      transactions: transactions ?? this.transactions,
      filteredTransactions: filteredTransactions ?? this.filteredTransactions,
      expenses: expenses ?? this.expenses,
      userInfoItems: userInfoItems ?? this.userInfoItems,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }
}
