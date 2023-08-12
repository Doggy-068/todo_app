import 'package:flutter/material.dart';
import 'package:todo_app/components/com_bottom_navigation_bar.dart';
import 'package:todo_app/screen/chart/index.dart';
import 'package:todo_app/screen/daily/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenNavigation extends StatelessWidget {
  const ScreenNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.navigation_title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.navigation_daily),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScreenDaily()),
              );
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.navigation_chart),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ScreenChart()),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: const ComBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
