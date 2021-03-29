# Theme Mode Builder 🚀

![Pub Version](https://img.shields.io/pub/v/theme_mode_builder?style=for-the-badge)
![GitHub](https://img.shields.io/github/license/YazeedAlKhalaf/theme_mode_builder?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/YazeedAlKhalaf/theme_mode_builder?style=for-the-badge)
![GitHub Pull Requests](https://img.shields.io/github/issues-pr/YazeedAlKhalaf/theme_mode_builder?style=for-the-badge)

> 1. I created this package to help standardize my apps way of theme handling.
> 2. The package uses [Stacked](https://pub.dev/packages/stacked) architecture which is an overkill for this small package but **YOLO**.
>
> Web Demo: <a href="https://theme-mode-builder.netlify.app/" target="_blank">https://theme-mode-builder.netlify.app/</a>

### Features:

- 🚀 Cross platform: mobile, desktop, browser
- ❤ Simple, powerful, intuitive API
- 🛡 Null Safety
- 🎈 **No** native dependencies
- 🔋 Batteries included

## 📚 How to Use

### Table of contents

1. [Video](#Video)
2. [Guide](#Guide)

### Video: (A bit outdated, for v0.0.3)

<div style="width: 500px;">
  <a href="https://youtu.be/yDwZHzBRsqQ" target="_blank">
    <img src="https://raw.githubusercontent.com/YazeedAlKhalaf/theme_mode_builder/main/readme_images/explainer_video_thumbnail.jpg" alt="Theme Mode Builder | Explaining Flutter Packages" />
  </a>
</div>

</br>

### Guide:

First run the initialization which is asynchronous so you will need to change the return type of your `main()` method from `void` to `Future<void>`:

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

Then just wrap your `MaterialApp` widget with the `ThemeModeBuilder` and return the `MaterialApp` widget from the `builder`.
The `builder` gives you two arguments, `builder: (BuildContext context, ThemeMode themeMode) {}`.
Pass the `themeMode` to `themeMode` on your `MaterialApp`.

Now this code below explains better than I do 🙈🚀😂:

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

### If you want to change the `themeMode` you just call:

```dart
await ThemeModeBuilderConfig.toggleTheme();
```

And the theme will change instantly given you followed the steps above correctly 🎉.

### Want more customization?

To change to dark mode:

```dart
await ThemeModeBuilderConfig.setDark();
```

To change to light mode:

```dart
await ThemeModeBuilderConfig.setLight();
```

To change to system mode:

```dart
await ThemeModeBuilderConfig.setSystem();
```

### To get the theme mode you can run:

```dart
final ThemeMode themeMode = ThemeModeBuilderConfig.getThemeMode();
```

### Finally, To check if the current theme is dark or not, you use this simple call:

```dart
final bool isDarkTheme = ThemeModeBuilderConfig.isDarkTheme();
```
