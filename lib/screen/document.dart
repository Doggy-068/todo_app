import 'package:flutter/material.dart';
import '../component/navigation.dart';

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
      bottomNavigationBar: const Navigation(
        currentIndex: 2,
      ),
    );
  }
}
