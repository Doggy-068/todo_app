import 'package:flutter/material.dart';
import 'package:todo_app/screen/home/index.dart';
import 'package:todo_app/screen/setting/index.dart';

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
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ScreenSetting(),
          ));
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}
