import 'package:flutter_test/flutter_test.dart';
import 'package:theme_mode_builder/common/constants.dart';

void main() {
  test(
    "should verify 'isDarkKey'",
    () {
      expect(Constants.isDarkKey, "is_dark_key");
    },
  );

  test(
    "should verify 'themeBox'",
    () {
      expect(Constants.themeBox, "theme_box");
    },
  );
}
