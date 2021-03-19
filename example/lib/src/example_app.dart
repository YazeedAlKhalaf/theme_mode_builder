import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';

/// this [ExampleApp] widget is the wrapper for out [MaterialApp] widget
/// and our [ThemeModeBuilder] widget. It is realy great!
class ExampleApp extends StatelessWidget {
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
        title: Text(
          'Theme Mode Builder Example',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// toggle functionality
          ElevatedButton(
            onPressed: () async {
              await ThemeModeBuilderConfig.toggleTheme();
            },
            child: Text(
              'Toggle Theme',
            ),
          ),

          /// spacing to make things look cool!
          const SizedBox(height: 15),

          /// separate buttons functionality
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// changes theme to light mode
              ElevatedButton(
                onPressed: ThemeModeBuilderConfig.isDarkTheme()
                    ? () async {
                        await ThemeModeBuilderConfig.toggleTheme();
                      }
                    : () {},
                child: Text(
                  'Light Theme',
                ),
              ),

              /// spacing to make things look cool!
              const SizedBox(width: 15),

              /// changes theme to darl mode
              ElevatedButton(
                onPressed: ThemeModeBuilderConfig.isDarkTheme()
                    ? () {}
                    : () async {
                        await ThemeModeBuilderConfig.toggleTheme();
                      },
                child: Text(
                  'Dark Theme',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
