import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';

import 'theme_mode_builder_model.dart';

class ThemeModeBuilder extends StatelessWidget {
  final Function(BuildContext, ThemeMode) builder;

  const ThemeModeBuilder({
    Key key,
    @required this.builder,
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
        Widget child,
      ) {
        return ValueListenableBuilder(
          valueListenable: model.themeBox.listenable(),
          builder: (
            BuildContext context,
            Box box,
            Widget child,
          ) {
            bool isDark = box.get(
              "is_dark_key",
              defaultValue: false,
            );
            ThemeMode themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

            return builder(context, themeMode);
          },
        );
      },
    );
  }
}
