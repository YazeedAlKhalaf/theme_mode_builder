import 'package:hive/hive.dart';
import 'package:theme_mode_builder/src/common/constants.dart';
import 'package:theme_mode_builder/src/services/hive_storage_service.dart';
import 'package:theme_mode_builder/src/theme_mode_builder/theme_mode_builder.dart';

/// [ThemeModeBuilderConfig] is a utility class where you can configure
/// the [ThemeModeBuilder] and change theme or check if the theme is dark.
class ThemeModeBuilderConfig {
  /// [ensureInitialized] initialized the [HiveStorageService]
  static Future<void> ensureInitialized() async {
    await HiveStorageService().init();
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
}
