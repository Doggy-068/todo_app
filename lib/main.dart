import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/home/index.dart';
import 'package:todo_app/database/index.dart';
import 'package:todo_app/storage/index.dart';

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
  Color _colorSchemeSeed = Colors.blue;

  void setColor(Color color) {
    setState(() {
      _colorSchemeSeed = color;
    });
  }

  @override
  void initState() {
    Storage.getThemeColor().then((value) => setColor(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _colorSchemeSeed,
      child: Provider.value(
        value: this,
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: _colorSchemeSeed,
          ),
          home: const ScreenHome(),
        ),
      ),
    );
  }
}
