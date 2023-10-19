import 'package:flutter/material.dart';
import '../screen/message.dart';
import '../screen/address.dart';
import '../screen/document.dart';
import '../screen/workbench.dart';

class Navigation extends StatelessWidget {
  final int currentIndex;

  const Navigation({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: '消息',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_page_outlined),
          label: '通讯录',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy_outlined),
          label: '云文档',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work_outline),
          label: '工作台',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (i) {
        if (i == currentIndex) return;
        switch (i) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenMessage(),
              ),
            );
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAddress(),
              ),
            );
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenDocument(),
              ),
            );
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenWorkbench(),
              ),
            );
        }
      },
    );
  }
}
