import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// [HiveStorageService] is a service used to abstract the complexity of using
/// the `hive` package directly. It gives higher level functions
/// to make everything easier.
class HiveStorageService {
  /// [init] initializes [Hive] and opens boxes.
  ///
  /// Boxes opened:
  /// * theme_box
  Future<void> init() async {
    await Hive.initFlutter();

    /// open boxes
    await openBox<bool>(
      boxName: "theme_box",
    );
  }

  /// [openBox] opens a hive box given you provide the name of the box.
  Future<Box<Y>> openBox<Y>({
    @required String boxName,
  }) async {
    final Box<Y> box = await Hive.openBox<Y>(
      boxName,
    );
    return box;
  }

  /// [getBox] gets a hive box given you provide the name of the box.
  Box<Y> getBox<Y>({
    @required String boxName,
  }) {
    return Hive.box<Y>(boxName);
  }
}
