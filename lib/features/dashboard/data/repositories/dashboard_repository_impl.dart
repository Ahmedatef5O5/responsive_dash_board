import '../../domain/models/all_expenses_item_model.dart';
import '../../domain/models/transaction_model.dart';
import '../../domain/models/user_info_model.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_mock_datasource.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardMockDatasource _datasource;

  DashboardRepositoryImpl({DashboardMockDatasource? datasource})
    : _datasource = datasource ?? DashboardMockDatasource();

  @override
  Future<List<TransactionModel>> getTransactions(String period) async {
    final raw = await _datasource.fetchTransactions(period);
    return raw
        .map(
          (json) => TransactionModel(
            title: json['title'] as String,
            subTitle: json['subTitle'] as String,
            amount: json['amount'] as String,
            isWithdrawal: json['isWithdrawal'] as bool,
          ),
        )
        .toList();
  }

  @override
  Future<List<AllExpensesItemModel>> getExpenses(String period) async {
    final raw = await _datasource.fetchExpenses(period);
    return raw
        .map(
          (json) => AllExpensesItemModel(
            image: json['image'] as String,
            title: json['title'] as String,
            date: json['date'] as String,
            price: json['price'] as String,
          ),
        )
        .toList();
  }

  @override
  Future<List<UserInfoModel>> getUserInfo() async {
    final raw = await _datasource.fetchUserInfo();
    return raw
        .map(
          (json) => UserInfoModel(
            image: json['image'] as String,
            title: json['title'] as String,
            subTitle: json['subTitle'] as String,
          ),
        )
        .toList();
  }

  @override
  Future<Map<String, double>> getSummary(String period) async {
    return _datasource.fetchSummary(period);
  }
}
