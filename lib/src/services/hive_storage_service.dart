import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

abstract class HiveStorageServiceAbstarct {
  const HiveStorageServiceAbstarct();

  Future<void> init();

  Future<Box> openBox({
    @required String boxName,
  });

  Box getBox({
    @required String boxName,
  });
}

class HiveStorageService extends HiveStorageServiceAbstarct {
  @override
  Future<void> init() async {
    await Hive.initFlutter();

    /// open boxes
    await openBox(
      boxName: "theme_box",
    );
  }

  @override
  Future<Box> openBox({
    @required String boxName,
  }) async {
    Box box = await Hive.openBox(
      boxName,
    );
    return box;
  }

  @override
  Box getBox({
    @required String boxName,
  }) {
    return Hive.box(boxName);
  }
}
