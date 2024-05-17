import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';

/// this [ThemeModeBuilderExampleApp] widget is the wrapper for our
/// [MaterialApp] widget and our [ThemeModeBuilder] widget.
/// It is realy great!
class ThemeModeBuilderExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp(
          title: "My Cool App",

          /// here is the `themeMode` passed form the `builder`
          themeMode: themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: Colors.red,
            ),

            /// put your light theme data here
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.dark,
              seedColor: Colors.deepPurple,
            ),

            /// put your dark theme data here
          ),
          home: Home(),
        );
      },
    );
  }
}

/// this the [Home] widget, it is where the main ui of this app lives!
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme Mode Builder Example',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// text to show current mode
              Text(
                "Current Mode: ${ThemeModeBuilderConfig.getThemeMode().toString().split(".").last.toUpperCase()}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              /// toggle functionality
              ElevatedButton(
                onPressed: () async {
                  await ThemeModeBuilderConfig.toggleTheme();
                },
                child: const Text(
                  'Toggle Theme',
                ),
              ),

              /// spacing to make things look cool!
              const SizedBox(height: 15),

              /// separate buttons functionality
              Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  /// changes theme to light mode
                  ElevatedButton.icon(
                    icon: const Icon(Icons.phone_android),
                    label: const Text(
                      "System Mode",
                    ),
                    onPressed: () async {
                      await ThemeModeBuilderConfig.setSystem();
                    },
                  ),

                  /// spacing to make things look cool!
                  const SizedBox(width: 15),

                  /// changes theme to darl mode
                  ElevatedButton.icon(
                    icon: const Icon(Icons.lightbulb),
                    label: const Text(
                      "Light Mode",
                    ),
                    onPressed: () async {
                      await ThemeModeBuilderConfig.setLight();
                    },
                  ),

                  /// spacing to make things look cool!
                  const SizedBox(width: 15),

                  /// changes theme to darl mode
                  ElevatedButton.icon(
                    icon: const Icon(Icons.lightbulb_outline),
                    label: const Text(
                      "Dark Mode",
                    ),
                    onPressed: () async {
                      await ThemeModeBuilderConfig.setDark();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
