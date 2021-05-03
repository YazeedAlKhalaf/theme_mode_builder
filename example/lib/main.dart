import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';
import 'package:theme_mode_builder_example/theme_mode_builder_example_app.dart';

Future<void> main() async {
  /// ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize theme mode builder
  await ThemeModeBuilderConfig.ensureInitialized(
    subDir: "Theme Mode Builder Example",
  );

  /// Runs the app :)
  runApp(ThemeModeBuilderExampleApp());
}
