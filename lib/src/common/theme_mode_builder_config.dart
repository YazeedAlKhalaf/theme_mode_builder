import 'package:hive/hive.dart';
import 'package:theme_mode_builder/src/services/hive_storage_service.dart';

class ThemeModeBuilderConfig {
  static Future<void> ensureInitialized() async {
    await HiveStorageService().init();
  }

  static Future<void> toggleTheme() async {
    final Box themeBox = HiveStorageService().getBox(
      boxName: "theme_box",
    );

    final bool isDarkTheme = themeBox.get(
      "is_dark_key",
    );

    await themeBox.put(
      "is_dark_key",
      !isDarkTheme,
    );
  }
}
