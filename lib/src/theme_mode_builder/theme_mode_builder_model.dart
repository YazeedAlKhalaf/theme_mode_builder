import 'package:hive/hive.dart';
import 'package:theme_mode_builder/src/common/custom_base_view_model.dart';
import 'package:theme_mode_builder/src/services/hive_storage_service.dart';

class ThemeModeBuilderModel extends CustomBaseViewModel {
  final HiveStorageService _hiveStorageService = HiveStorageService();

  Box _themeBox;
  Box get themeBox => _themeBox;
  void setThemeBox(Box newValue) {
    _themeBox = newValue;
    notifyListeners();
  }

  void init() {
    Box themeBoxTemp = _hiveStorageService.getBox(
      boxName: "theme_box",
    );

    setThemeBox(themeBoxTemp);
  }
}
