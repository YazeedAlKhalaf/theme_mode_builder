import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// TODO: make sure to solve this
// ignore: import_of_legacy_library_into_null_safe
import 'package:stacked/stacked.dart';
import 'package:theme_mode_builder/src/common/constants.dart';

import 'theme_mode_builder_model.dart';

/// [ThemeModeBuilder] constructor, you need to provide the [builder].
class ThemeModeBuilder extends StatelessWidget {
  /// [builder] requires you to return a [Widget] and provides two arguments:
  ///
  /// The two arguments are:
  /// * [BuildContext], context; the thing that no body knows what it is
  /// * [ThemeMode], tells you what is the current theme mode
  final Widget Function(BuildContext, ThemeMode) builder;

  /// [ThemeModeBuilder] constructor, you need to provide the [builder].
  const ThemeModeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThemeModeBuilderModel>.reactive(
      viewModelBuilder: () => ThemeModeBuilderModel(),
      onModelReady: (ThemeModeBuilderModel model) {
        model.init();
      },
      builder: (
        BuildContext context,
        ThemeModeBuilderModel model,
        Widget? child,
      ) {
        return ValueListenableBuilder<Box<bool>>(
          valueListenable: model.themeBox!.listenable(),
          builder: (
            BuildContext? context,
            Box<bool>? box,
            Widget? child,
          ) {
            final bool? isDark = box?.get(
              Constants.isDarkKey,
              defaultValue: false,
            );
            final ThemeMode themeMode =
                isDark! ? ThemeMode.dark : ThemeMode.light;

            return builder(context!, themeMode);
          },
        );
      },
    );
  }
}
