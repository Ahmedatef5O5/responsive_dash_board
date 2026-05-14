class DashboardMockDatasource {
  Future<List<Map<String, dynamic>>> fetchTransactions(String period) async {
    await Future.delayed(const Duration(milliseconds: 700));

    final data = {
      'Weekly': [
        {
          'title': 'Cash Withdrawal',
          'subTitle': '12 Apr, 2024',
          'amount': r'$1,200',
          'isWithdrawal': true,
        },
        {
          'title': 'Landing Page Project',
          'subTitle': '10 Apr, 2024',
          'amount': r'$3,500',
          'isWithdrawal': false,
        },
        {
          'title': 'Juni Mobile App',
          'subTitle': '8 Apr, 2024',
          'amount': r'$5,000',
          'isWithdrawal': false,
        },
      ],
      'Monthly': [
        {
          'title': 'Office Rent',
          'subTitle': '1 Apr, 2024',
          'amount': r'$2,000',
          'isWithdrawal': true,
        },
        {
          'title': 'E-Commerce Project',
          'subTitle': '5 Apr, 2024',
          'amount': r'$12,000',
          'isWithdrawal': false,
        },
        {
          'title': 'SaaS Dashboard Project',
          'subTitle': '15 Apr, 2024',
          'amount': r'$8,500',
          'isWithdrawal': false,
        },
        {
          'title': 'Subscriptions',
          'subTitle': '20 Apr, 2024',
          'amount': r'$350',
          'isWithdrawal': true,
        },
      ],
      'Yearly': [
        {
          'title': 'Annual Tax',
          'subTitle': 'Jan, 2024',
          'amount': r'$15,000',
          'isWithdrawal': true,
        },
        {
          'title': 'Brand Identity Project',
          'subTitle': 'Mar, 2024',
          'amount': r'$45,000',
          'isWithdrawal': false,
        },
        {
          'title': 'Mobile App Suite',
          'subTitle': 'Jun, 2024',
          'amount': r'$80,000',
          'isWithdrawal': false,
        },
        {
          'title': 'Annual Software Subs',
          'subTitle': 'Jan, 2024',
          'amount': r'$2,400',
          'isWithdrawal': true,
        },
      ],
    };

    return List<Map<String, dynamic>>.from(data[period] ?? data['Weekly']!);
  }

  Future<List<Map<String, dynamic>>> fetchExpenses(String period) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final data = {
      'Weekly': [
        {
          'image': 'assets/images/food.svg',
          'title': 'Food & Drinks',
          'date': 'This Week',
          'price': r'$320',
        },
        {
          'image': 'assets/images/transport.svg',
          'title': 'Transport',
          'date': 'This Week',
          'price': r'$85',
        },
        {
          'image': 'assets/images/entertainment.svg',
          'title': 'Entertainment',
          'date': 'This Week',
          'price': r'$150',
        },
      ],
      'Monthly': [
        {
          'image': 'assets/images/food.svg',
          'title': 'Food & Drinks',
          'date': 'Apr 2024',
          'price': r'$1,200',
        },
        {
          'image': 'assets/images/transport.svg',
          'title': 'Transport',
          'date': 'Apr 2024',
          'price': r'$450',
        },
        {
          'image': 'assets/images/entertainment.svg',
          'title': 'Entertainment',
          'date': 'Apr 2024',
          'price': r'$800',
        },
        {
          'image': 'assets/images/health.svg',
          'title': 'Healthcare',
          'date': 'Apr 2024',
          'price': r'$300',
        },
      ],
      'Yearly': [
        {
          'image': 'assets/images/food.svg',
          'title': 'Food & Drinks',
          'date': '2024',
          'price': r'$14,400',
        },
        {
          'image': 'assets/images/transport.svg',
          'title': 'Transport',
          'date': '2024',
          'price': r'$5,400',
        },
        {
          'image': 'assets/images/entertainment.svg',
          'title': 'Entertainment',
          'date': '2024',
          'price': r'$9,600',
        },
        {
          'image': 'assets/images/health.svg',
          'title': 'Healthcare',
          'date': '2024',
          'price': r'$3,600',
        },
        {
          'image': 'assets/images/education.svg',
          'title': 'Education',
          'date': '2024',
          'price': r'$6,000',
        },
      ],
    };

    return List<Map<String, dynamic>>.from(data[period] ?? data['Weekly']!);
  }

  Future<List<Map<String, dynamic>>> fetchUserInfo() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      {
        'image': 'assets/icons/user.svg',
        'title': 'Ahmed Hassan',
        'subTitle': 'ahmed@example.com',
      },
      {
        'image': 'assets/icons/wallet.svg',
        'title': 'Main Account',
        'subTitle': '**** **** 4291',
      },
      {
        'image': 'assets/icons/chart.svg',
        'title': 'Pro Plan',
        'subTitle': 'Active until Dec 2025',
      },
    ];
  }

  Future<Map<String, double>> fetchSummary(String period) async {
    await Future.delayed(const Duration(milliseconds: 400));
    const summaries = {
      'Weekly': {'income': 12500.0, 'expenses': 4200.0},
      'Monthly': {'income': 48000.0, 'expenses': 17500.0},
      'Yearly': {'income': 576000.0, 'expenses': 210000.0},
    };
    return Map<String, double>.from(summaries[period] ?? summaries['Weekly']!);
  }
}
