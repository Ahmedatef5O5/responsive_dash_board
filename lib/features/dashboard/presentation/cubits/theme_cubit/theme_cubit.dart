import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  static const _key = 'isDarkMode';

  ThemeCubit() : super(const ThemeState(isDark: false));

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_key) ?? false;
    emit(ThemeState(isDark: isDark));
  }

  Future<void> toggleTheme() async {
    final newValue = !state.isDark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, newValue);
    emit(ThemeState(isDark: newValue));
  }
}
