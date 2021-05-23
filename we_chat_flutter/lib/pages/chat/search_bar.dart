import 'package:flutter/material.dart';
import 'package:we_chat_flutter/pages/chat/search_page.dart';

import '../uset_const.dart';
import 'chat.dart';
class SearchCell extends StatelessWidget {
  final List<Chat> datas;

  const SearchCell({Key key, this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context)=>SearchPage(datas:datas))
        );
      },
      child: Container(
        height: 44,
        padding: EdgeInsets.all(5),
        color: WeChatBGThemeColor,
        child: Container(
          height: 34,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('images/放大镜b.png'),width: 15,color: Colors.grey,),
              Text('  搜索',style: TextStyle(fontSize: 15,color: Colors.grey),),
            ],
          ),
        ),

      ),
    );
  }
}



class SearchBar extends StatefulWidget {

  final ValueChanged<String> onChanged;

  const SearchBar({Key key, this.onChanged}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}



class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;

  _onChange(String text){
    widget.onChanged(text);
    if(text.length > 0){
      _showClear = true;
      setState(() {});
    }else{
      _showClear = false;
      setState(() {});
    }
  }

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
                            contentPadding: EdgeInsets.only(left: 5,bottom: 10),
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