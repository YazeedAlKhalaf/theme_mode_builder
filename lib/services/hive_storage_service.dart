import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_mode_builder/common/constants.dart';

/// [HiveStorageService] is a service used to abstract the complexity of using
/// the `hive` package directly. It gives higher level functions
/// to make everything easier.
class HiveStorageService {
  /// [init] initializes [Hive] and opens boxes.
  ///
  /// You must provide a [subDir] where the boxes should be stored, else the
  /// boxes will be in the documents directory.
  ///
  /// Boxes opened:
  /// * theme_box
  Future<void> init({
    required String? subDir,
  }) async {
    await Hive.initFlutter(subDir);

    /// open boxes
    await openBox<bool>(
      boxName: Constants.themeBox,
    );
  }

  /// [openBox] opens a hive box given you provide the name of the box.
  Future<Box<Y>> openBox<Y>({
    required String boxName,
  }) async {
    final Box<Y> box = await Hive.openBox<Y>(
      boxName,
    );
    return box;
  }

  /// [getBox] gets a hive box given you provide the name of the box.
  Box<Y> getBox<Y>({
    required String boxName,
  }) {
    return Hive.box<Y>(boxName);
  }
}
