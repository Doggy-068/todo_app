import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/home/index.dart';
import 'package:todo_app/database/index.dart';
import 'package:todo_app/storage/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(Provider<AppDatabase>(
    create: (context) => AppDatabase(),
    child: const App(),
    dispose: (context, db) => db.close(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  Locale _locale = const Locale('en');
  Color _colorSchemeSeed = Colors.blue;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void setColor(Color color) {
    setState(() {
      _colorSchemeSeed = color;
    });
  }

  @override
  void initState() {
    Storage.getThemeColor().then((value) => setColor(value));
    Storage.getLocale().then((value) => setLocale(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: this,
      child: MaterialApp(
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('zh'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: _colorSchemeSeed,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
