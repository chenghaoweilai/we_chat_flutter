import 'package:flutter/material.dart';

import '../uset_const.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchTopBar(),
          Expanded(
              flex: 1,
              child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                    return Text('1111111');
                  })))
        ],
      ),
    );
  }
}

class SearchTopBar extends StatefulWidget {
  @override
  _SearchTopBarState createState() => _SearchTopBarState();
}

class _SearchTopBarState extends State<SearchTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WeChatBGThemeColor,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ), //上半部分
          Container(
            height: 44,
            child: Row(
              children: <Widget>[
                Container(
                  height: 35,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  width: ScreenWidth(context) - 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/放大镜b.png'),
                        width: 20,
                        color: Colors.grey,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _controller,
                          onChanged: _onChange ,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 5),
                            hintText: '搜索',
                          ),
                        ),
                      ), //输入框
                      _showClear ?  GestureDetector(
                        onTap: (){
                          _controller.clear();
                          _onChange('');
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ) : Container(), //清除按钮1
                    ],
                  ),
                ), //左边圆角背景
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消'),
                ), //取消按钮
              ],
            ),
          ),
        ],
      ),
    );
  }
}
