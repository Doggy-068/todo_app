import 'package:flutter/material.dart';
import './message.dart';
import './document.dart';
import './workbench.dart';

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

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
                    '通讯录',
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
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: const Icon(
                    Icons.add_ic_call_outlined,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 16,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'XXX',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const ListTile(
                  leading: Icon(Icons.account_tree_outlined),
                  title: Text('组织内联系人'),
                  trailing: Icon(Icons.chevron_right_outlined),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_tree_outlined),
                        title: Text('外部联系人'),
                        trailing: Icon(Icons.chevron_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_add_alt_1_outlined),
                        title: Text('新的联系人'),
                        trailing: Icon(Icons.chevron_right_outlined),
                      ),
                      ListTile(
                        leading: Icon(Icons.star_border_outlined),
                        title: Text('星标联系人'),
                        trailing: Icon(Icons.chevron_right_outlined),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.contact_mail_outlined),
                    title: Text('邮箱通讯录'),
                    trailing: Icon(Icons.chevron_right_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.group_outlined),
                    title: Text('我的群组'),
                    trailing: Icon(Icons.chevron_right_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.call_outlined),
                    title: Text('服务台'),
                    trailing: Icon(Icons.chevron_right_outlined),
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
        currentIndex: 1,
        onTap: (i) {
          if (i == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenMessage(),
              ),
            );
          } else if (i == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenDocument(),
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
