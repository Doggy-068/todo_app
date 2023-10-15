import 'package:flutter/material.dart';
import './message.dart';
import './address.dart';
import './workbench.dart';

class ScreenDocument extends StatelessWidget {
  const ScreenDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const CircleAvatar(),
                ),
                const Expanded(
                  child: Text(
                    '云文档',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            children: const [
              Column(
                children: [
                  Icon(Icons.folder_copy_outlined),
                  Text('我的空间'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.folder_copy_outlined),
                  Text('共享空间'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.folder_copy_outlined),
                  Text('知识库'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.folder_copy_outlined),
                  Text('收藏'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.download_outlined),
                  Text('离线'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.folder_copy_outlined),
                  Text('模板库'),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'xxx',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'xxx',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 2,
        onTap: (i) {
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenMessage(),
              ),
            );
          } else if (i == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenAddress(),
              ),
            );
          } else if (i == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenWorkbench(),
              ),
            );
          }
        },
      ),
    );
  }
}
