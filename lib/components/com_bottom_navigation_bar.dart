import 'package:flutter/material.dart';
import 'package:todo_app/screen/home/index.dart';
import 'package:todo_app/screen/navigation/index.dart';
import 'package:todo_app/screen/setting/index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ComBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const ComBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        if (value == 0) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ScreenHome(),
          ));
        } else if (value == 1) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ScreenNavigation(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ScreenSetting(),
          ));
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!
              .component_com_bottom_navigation_bar_home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.navigation),
          label: AppLocalizations.of(context)!
              .component_com_bottom_navigation_bar_navigation,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!
              .component_com_bottom_navigation_bar_setting,
        ),
      ],
    );
  }
}
