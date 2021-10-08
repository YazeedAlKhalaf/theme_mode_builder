import 'package:hive/hive.dart';
import 'package:theme_mode_builder/common/constants.dart';
import 'package:theme_mode_builder/common/custom_base_view_model.dart';
import 'package:theme_mode_builder/services/hive_storage_service.dart';

/// [ThemeModeBuilderModel] is where all the logic of the builder exists.
class ThemeModeBuilderModel extends CustomBaseViewModel {
  final HiveStorageService _hiveStorageService = HiveStorageService();

  Box<bool>? _themeBox;

  /// [themeBox] is a getter for the theme box of type `bool`.
  Box<bool>? get themeBox => _themeBox;

  /// [setThemeBox] sets the private variable [_themeBox] with the
  /// the provided new value.
  void setThemeBox(Box<bool> newValue) {
    _themeBox = newValue;
    notifyListeners();
  }

  /// [init] gets the theme box and sets it using [setThemeBox].
  void init() {
    final Box<bool> themeBoxTemp = _hiveStorageService.getBox<bool>(
      boxName: Constants.themeBox,
    );

    setThemeBox(themeBoxTemp);
  }
}
