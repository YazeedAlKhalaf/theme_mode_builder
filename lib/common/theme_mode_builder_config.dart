import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path_helper;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_mode_builder/services/theme_storage_service.dart';

/// [ThemeModeBuilderConfig] is a utility class where you can configure
/// the [ThemeModeBuilder] and change theme or check if the theme is dark.
class ThemeModeBuilderConfig extends ChangeNotifier {
  static late ThemeStorageService _themeStorageService;

  static final ThemeModeBuilderConfig _instance =
      ThemeModeBuilderConfig._internal();

  /// [ThemeModeBuilderConfig] factory singleton provider.
  factory ThemeModeBuilderConfig() {
    return _instance;
  }

  ThemeModeBuilderConfig._internal();

  /// [ensureInitialized] initialized the [ThemeStorageService]
  ///
  /// The [subDir] will now be deleting the directory of the theme storage, if it exists.
  static Future<void> ensureInitialized({
    String? subDir,
  }) async {
    if (subDir != null) {
      if (kIsWeb) return;

      final Directory appDir = await getApplicationDocumentsDirectory();
      final String pathToDelete = path_helper.join(appDir.path, subDir);
      final Directory dir = Directory(pathToDelete);
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    }

    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    _themeStorageService = ThemeStorageService(sharedPreferences: sharedPrefs);
    _themeStorageService.addListener(() {
      _instance.notifyListeners();
    });
  }

  /// [themeStorageService] returns the instance of the [ThemeStorageService].
  static ThemeStorageService get themeStorageService => _themeStorageService;

  /// [isDarkTheme] checks if the current theme mode is dark or not and returns
  /// the value as a `bool`.
  static bool isDarkTheme() {
    return getThemeMode() == ThemeMode.dark;
  }

  /// [toggleTheme] toggles the theme between two values.
  ///
  /// The two values:
  /// * dark
  /// * light
  static Future<void> toggleTheme() async {
    final ThemeMode themeMode = getThemeMode();
    switch (themeMode) {
      case ThemeMode.system:
      case ThemeMode.light:
        await setDark();
        break;
      case ThemeMode.dark:
        await setLight();
        break;
    }
  }

  /// [setDark] changes the theme mode to dark.
  static Future<void> setDark() async {
    await _themeStorageService.setThemeMode(ThemeMode.dark);
  }

  /// [setLight] changes the theme mode to light.
  static Future<void> setLight() async {
    await _themeStorageService.setThemeMode(ThemeMode.light);
  }

  /// [setSystem] changes the theme mode to system.
  static Future<void> setSystem() async {
    await _themeStorageService.setThemeMode(ThemeMode.system);
  }

  /// [getThemeMode] returns the theme mode based on the saved value.
  static ThemeMode getThemeMode() {
    return _themeStorageService.getThemeMode();
  }
}
