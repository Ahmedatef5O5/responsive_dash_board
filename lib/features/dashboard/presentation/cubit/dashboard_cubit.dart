import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finDashBoard/features/dashboard/domain/models/all_expenses_item_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/transaction_model.dart';
import 'package:finDashBoard/features/dashboard/domain/models/user_info_model.dart';
import '../../domain/models/dash_board_data.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());

  Future<void> loadDashboard() async {
    emit(DashboardLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final data = _getMockData('Weekly');
      emit(DashboardSuccess(data));
    } catch (e) {
      emit(DashboardError('failed load data ,try again later.'));
    }
  }

  Future<void> changePeriod(String period) async {
    final currentState = state;
    if (currentState is DashboardSuccess) {
      emit(DashboardLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final newData = _getMockData(period);
      emit(DashboardSuccess(newData));
    }
  }

  DashboardData _getMockData(String period) {
    return DashboardData(
      selectedPeriod: period,
      totalIncome:
          period == 'Weekly'
              ? 12500
              : period == 'Monthly'
              ? 48000
              : 576000,
      totalExpenses:
          period == 'Weekly'
              ? 4200
              : period == 'Monthly'
              ? 17500
              : 210000,
      transactions: const [
        TransactionModel(
          title: 'Cash Withdrawal',
          subTitle: '12 Apr, 2024',
          amount: r'$20,129',
          isWithdrawal: true,
        ),
        TransactionModel(
          title: 'Landing Page Project',
          subTitle: '10 Apr, 2024',
          amount: r'$8,500',
          isWithdrawal: false,
        ),
        TransactionModel(
          title: 'Juni Mobile App Project',
          subTitle: '8 Apr, 2024',
          amount: r'$15,000',
          isWithdrawal: false,
        ),
      ],
      expenses: const [
        AllExpensesItemModel(
          image: 'assets/images/expense1.svg',
          title: 'Food & Drinks',
          date: 'Apr 2024',
          price: r'$1,200',
        ),
        AllExpensesItemModel(
          image: 'assets/images/expense2.svg',
          title: 'Transport',
          date: 'Apr 2024',
          price: r'$450',
        ),
        AllExpensesItemModel(
          image: 'assets/images/expense3.svg',
          title: 'Entertainment',
          date: 'Apr 2024',
          price: r'$800',
        ),
      ],
      userInfoItems: const [
        UserInfoModel(
          image: 'assets/icons/user.svg',
          title: 'Ahmed Hassan',
          subTitle: 'ahmed@example.com',
        ),
        UserInfoModel(
          image: 'assets/icons/wallet.svg',
          title: 'Main Account',
          subTitle: '**** **** 4291',
        ),
      ],
    );
  }
}
