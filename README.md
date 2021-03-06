# Theme Mode Builder

> 1. I created this package to help standardize my apps way of theme handling.
> 2. The package uses [Stacked](https://pub.dev/packages/stacked) architecture which is an over kill for this small package but **YOLO**.

## 📚 How to Use

First run the initialization which is asynchronous so you will need to make you `main()` method a `Future`:

```dart
Future<void> main() async {
  /// ensure widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize theme mode builder
  await ThemeModeBuilderConfig.ensureInitialized();

  /// Runs the app :)
  runApp(MyCoolApp());
}
```

Then you just wrap your `MaterialApp` widget with the `ThemeModeBuilder` and return the `MaterialApp` widget from the `builder`. The `builder` gives you two arguments, `builder: (BuildContext context, ThemeMode themeMode) {}`. Pass the `themeMode` to `themeMode` on your `MaterialApp`.

Now this code below explains better than I do 🙈🌹:

```dart
import "package:flutter/material.dart";
import "package:theme_mode_builder/theme_mode_builder.dart";

class MyCoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          title: "My Cool App",

          /// here is the `themeMode` passed form the `builder`
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,

            /// put your light theme data here
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,

            /// put your dark theme data here
          ),
        );
      },
    );
  }
}
```
