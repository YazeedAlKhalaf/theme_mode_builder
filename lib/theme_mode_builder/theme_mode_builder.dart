import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_builder/common/theme_mode_builder_config.dart';
import 'package:theme_mode_builder/services/theme_storage_service.dart';

/// [ThemeModeBuilder] constructor, you need to provide the [builder].
class ThemeModeBuilder extends StatelessWidget {
  /// [builder] requires you to return a [Widget] and provides two arguments:
  ///
  /// The two arguments are:
  /// * [BuildContext], context; the thing that nobody knows what it is
  /// * [ThemeMode], tells you what is the current theme mode
  final Widget Function(BuildContext, ThemeMode) builder;

  /// [ThemeModeBuilder] constructor, you need to provide the [builder].
  const ThemeModeBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: ThemeModeBuilderConfig.ensureInitialized(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider<ThemeStorageService>.value(
            value: ThemeModeBuilderConfig.themeStorageService,
            child: Consumer<ThemeStorageService>(
              builder: (BuildContext context,
                  ThemeStorageService themeStorageService, Widget? child) {
                return builder(context, themeStorageService.getThemeMode());
              },
            ),
          );
        } else {
          // You can return a loading widget while the initialization is in progress
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
