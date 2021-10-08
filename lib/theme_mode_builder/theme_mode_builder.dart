import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_builder/common/theme_mode_builder_config.dart';

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
    return ChangeNotifierProvider<ThemeModeBuilderModel>(
      create: (BuildContext context) {
        final ThemeModeBuilderModel themeModeBuilderModel =
            ThemeModeBuilderModel();

        themeModeBuilderModel.init();

        return themeModeBuilderModel;
      },
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return ValueListenableBuilder<Box<bool>>(
          valueListenable:
              context.read<ThemeModeBuilderModel>().themeBox!.listenable(),
          builder: (
            BuildContext? context,
            Box<bool>? box,
            Widget? child,
          ) {
            return builder(
              context!,
              ThemeModeBuilderConfig.getThemeMode(),
            );
          },
        );
      },
    );
  }
}
