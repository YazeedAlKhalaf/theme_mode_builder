import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';
import 'package:theme_mode_builder_example/src/example_app.dart';

Future<void> main() async {
  /// ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize theme mode builder
  await ThemeModeBuilderConfig.ensureInitialized();

  /// Runs the app :)
  runApp(ExampleApp());
}
