import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _isDarkKey = 'isDark__theme_mode_builder';

/// [ThemeStorageService] is a service used to abstract the complexity of using
/// the `shared_preferences` package directly to manipulate theme stuff.
/// It gives higher level functions to make everything easier.
class ThemeStorageService extends ChangeNotifier {
  final SharedPreferences _sharedPreferences;

  /// [ThemeStorageService] constructor, you need to provide the [sharedPreferences].
  ThemeStorageService({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  /// [getThemeMode] gets the current theme mode and returns it as a `ThemeMode`.
  ThemeMode getThemeMode() {
    final bool? isDark = _sharedPreferences.getBool(_isDarkKey);

    switch (isDark) {
      case true:
        return ThemeMode.dark;
      case false:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  /// [setThemeMode] sets the theme mode based on the provided [themeMode].
  Future<void> setThemeMode(ThemeMode themeMode) async {
    switch (themeMode) {
      case ThemeMode.dark:
        await _sharedPreferences.setBool(_isDarkKey, true);
        break;
      case ThemeMode.light:
        await _sharedPreferences.setBool(_isDarkKey, false);
        break;
      case ThemeMode.system:
        await _sharedPreferences.remove(_isDarkKey);
        break;
    }

    notifyListeners();
  }
}
