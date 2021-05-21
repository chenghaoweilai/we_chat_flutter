import 'package:flutter/material.dart';

import 'package:we_chat_flutter/pages/chat/chat_page.dart';
import 'package:we_chat_flutter/pages/discover/discover_page.dart';
import 'package:we_chat_flutter/pages/friends/friends_page.dart';
import 'package:we_chat_flutter/pages/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootState();
  }
}

class _RootState extends State<RootPage> {
  final PageController _controller = PageController(

  );


  int _currentIndex = 0;
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
            _controller.jumpToPage(index);
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
              icon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_friends.png'),),
              activeIcon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_friends_hl.png'),),
              title: Text('通讯录'),
            ),
            BottomNavigationBarItem(
              icon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_discover.png'),),
              activeIcon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_discover_hl.png'),),
              title: Text('发现'),
            ),
            BottomNavigationBarItem(
              icon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_mine.png'),),
              activeIcon: Image(height: 20,width: 20,image: AssetImage('images/tabbar_mine_hl.png'),),
              title: Text('我'),
            ),
          ],
        ),
        body: PageView(
          controller: _controller,
          children: pages,
          onPageChanged: (int index){
            _currentIndex = index;
            setState(() {
            });
          },
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
