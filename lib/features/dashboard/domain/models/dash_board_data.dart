import 'package:finDashBoard/features/dashboard/domain/models/all_expenses_item_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/transaction_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/user_info_model.dart';

class DashboardData {
  final List<TransactionModel> transactions;
  final List<AllExpensesItemModel> expenses;
  final List<UserInfoModel> userInfoItems;
  final double totalIncome;
  final double totalExpenses;
  final String selectedPeriod;

  const DashboardData({
    required this.transactions,
    required this.expenses,
    required this.userInfoItems,
    required this.totalIncome,
    required this.totalExpenses,
    required this.selectedPeriod,
  });

  DashboardData copyWith({
    List<TransactionModel>? transactions,
    List<AllExpensesItemModel>? expenses,
    List<UserInfoModel>? userInfoItems,
    double? totalIncome,
    double? totalExpenses,
    String? selectedPeriod,
  }) {
    return DashboardData(
      transactions: transactions ?? this.transactions,
      expenses: expenses ?? this.expenses,
      userInfoItems: userInfoItems ?? this.userInfoItems,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
    );
  }
}
