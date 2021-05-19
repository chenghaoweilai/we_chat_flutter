import 'package:flutter/material.dart';

import 'package:we_chat_flutter/pages/chat_page.dart';
import 'package:we_chat_flutter/pages/discover/discover_page.dart';
import 'package:we_chat_flutter/pages/friends_page.dart';
import 'package:we_chat_flutter/pages/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootState();
  }
}

class _RootState extends State<RootPage> {
  int _currentIndex = 3;
  List<Widget> pages = [
    ChatPage(),
    FriendsPage(),
    DiscoverPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            _currentIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          selectedFontSize: 12.0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_chat.png'),),
              activeIcon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_chat_hl.png'),),
              title: Text('微信'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('通讯录'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('发现'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('我'),
            ),
          ],
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}
