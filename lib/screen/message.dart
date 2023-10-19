import 'package:flutter/material.dart';
import './chat.dart';
import '../component/navigation.dart';

class ScreenMessage extends StatelessWidget {
  ScreenMessage({super.key});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 26,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('状态'),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'xxx',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.qr_code_2_outlined),
                      Icon(Icons.chevron_right_outlined),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    'xxx',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: const Icon(Icons.verified_user),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: '输入你的个性签名...',
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('我的个人名片'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wallet_outlined),
                      title: Text('钱包'),
                    ),
                    ListTile(
                      leading: Icon(Icons.star_border_outlined),
                      title: Text('收藏'),
                    ),
                    ListTile(
                      leading: Icon(Icons.group_add_outlined),
                      title: Text('添加账号'),
                    ),
                    ListTile(
                      leading: Icon(Icons.group_add_outlined),
                      title: Text('登陆设备'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings_outlined),
                      title: Text('设置'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                  child: GestureDetector(
                    onTap: () {
                      _globalKey.currentState?.openDrawer();
                    },
                    child: const CircleAvatar(),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'XXX',
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
                PopupMenuButton(
                  offset: const Offset(0, 32 + 10),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: const Icon(
                      Icons.add_circle_outline,
                      size: 32,
                    ),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.scanner_outlined),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text('扫一扫'),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.group_outlined),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text('创建群组'),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.group_add_outlined),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text('添加企业成员'),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.person_add_alt),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text('添加外部联系人'),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.file_open_outlined),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text('创建文档'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: List.filled(30, 1)
                  .map(
                    (e) => ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenChat(),
                          ),
                        );
                      },
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      leading: const CircleAvatar(
                        radius: 24,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  'XXX',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: const Text(
                                  '15:30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'xxx',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navigation(
        currentIndex: 0,
      ),
    );
  }
}
