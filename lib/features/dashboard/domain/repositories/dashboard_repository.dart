import 'package:finDashBoard/features/dashboard/domain/models/all_expenses_item_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/transaction_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/user_info_model.dart';

abstract class DashboardRepository {
  Future<List<TransactionModel>> getTransactions(String period);
  Future<List<AllExpensesItemModel>> getExpenses(String period);
  Future<List<UserInfoModel>> getUserInfo();
  Future<Map<String, double>> getSummary(String period);
}
