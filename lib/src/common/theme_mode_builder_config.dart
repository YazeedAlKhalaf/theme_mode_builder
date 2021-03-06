import 'package:theme_mode_builder/src/services/hive_storage_service.dart';

class ThemeModeBuilderConfig {
  static Future<void> ensureInitialized() async {
    await HiveStorageService().init();
  }
}
