import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/com_bottom_navigation_bar.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/storage/index.dart';

class ScreenSetting extends StatelessWidget {
  const ScreenSetting({super.key});

  static const double rowHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('App Language'),
                  PopupMenuButton(
                    icon: const Icon(Icons.language),
                    tooltip: 'Show language',
                    itemBuilder: (BuildContext content) => [
                      {'label': 'English', 'value': 'English'},
                      {'label': '简体中文', 'value': 'Chinese'},
                    ]
                        .map(
                          (item) => PopupMenuItem(
                            child: Text(item['label'] as String),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Theme Color'),
                  PopupMenuButton(
                    icon: const Icon(Icons.palette_outlined),
                    tooltip: 'Show color',
                    onSelected: (color) {
                      context.read<AppState>().setColor(color);
                      Storage.setThemeColor(color);
                    },
                    itemBuilder: (BuildContext context) => [
                      {'label': 'Blue', 'value': Colors.blue},
                      {'label': 'Green', 'value': Colors.green},
                      {'label': 'Pink', 'value': Colors.pink},
                      {'label': 'Purple', 'value': Colors.purple},
                    ]
                        .map(
                          (item) => PopupMenuItem(
                            value: item['value'] as Color,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.palette_outlined,
                                  color: item['value'] as Color,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    item['label'] as String,
                                    style: TextStyle(
                                      color: item['value'] as Color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: rowHeight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const AboutDialog(),
                    ),
                  );
                },
                child: const Row(
                  children: [Text('About')],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ComBottomNavigationBar(
        currentIndex: 1,
      ),
    );
  }
}
