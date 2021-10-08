import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:theme_mode_builder/common/constants.dart';
import 'package:theme_mode_builder/services/hive_storage_service.dart';
import 'package:theme_mode_builder/theme_mode_builder/theme_mode_builder.dart';

/// [ThemeModeBuilderConfig] is a utility class where you can configure
/// the [ThemeModeBuilder] and change theme or check if the theme is dark.
class ThemeModeBuilderConfig {
  /// [ensureInitialized] initialized the [HiveStorageService]
  ///
  /// You could provide a [subDir] where the boxes should be stored, else the
  /// boxes will be in the documents directory.
  /// So for example if [subDir] is `Theme Mode Builder Example`, the directory
  /// where the boxes will be saved is `~/Documents/Theme Mode Builder Example`.
  static Future<void> ensureInitialized({
    String? subDir,
  }) async {
    await HiveStorageService().init(
      subDir: subDir,
    );
  }

  /// [isDarkTheme] check if the current theme mode is dark or not and returns
  /// the value as a `bool`.
  ///
  /// Thw two possible values:
  /// * true (dark)
  /// * false (light)
  static bool isDarkTheme() {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );

    final bool? isDarkTheme = themeBox.get(
      Constants.isDarkKey,
    );

    return isDarkTheme ?? false;
  }

  /// [toggleTheme] toggles the theme between the two possible values.
  ///
  /// Thw two possible values:
  /// * dark (true)
  /// * light (false)
  static Future<void> toggleTheme() async {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );

    await themeBox.put(
      Constants.isDarkKey,
      !isDarkTheme(),
    );
  }

  /// [setDark] changes the theme to dark.
  static Future<void> setDark() async {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );
    await themeBox.put(
      Constants.isDarkKey,
      true,
    );
  }

  /// [setLight] changes the theme to light.
  static Future<void> setLight() async {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );
    await themeBox.put(
      Constants.isDarkKey,
      false,
    );
  }

  /// [setSystem] deletes the key of dark mode.
  static Future<void> setSystem() async {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );
    await themeBox.delete(
      Constants.isDarkKey,
    );
  }

  /// [getThemeMode] returns the theme mode based on the saved value.
  static ThemeMode getThemeMode() {
    final Box<bool> themeBox = HiveStorageService().getBox<bool>(
      boxName: Constants.themeBox,
    );

    final bool? isDarkMode = themeBox.get(
      Constants.isDarkKey,
    );

    switch (isDarkMode) {
      case true:
        return ThemeMode.dark;
      case false:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
