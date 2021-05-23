import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:we_chat_flutter/pages/chat/search_bar.dart';

import '../uset_const.dart';
import 'package:http/http.dart' as http;

import 'chat.dart';

/*
* 混入（Mixinx）
* 用来给类添加功能。with 混入一个或多个类
*
* */

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}
//http://rap2api.taobao.org/app/mock/283838/api/chat/list

PopupMenuItem<String> _buildItem(String assImg, String text) {
  return PopupMenuItem(
    child: Row(
      children: [
        Image(
          image: AssetImage(assImg),
          width: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    ),
  );
}

//PopupMenuItemBuilder<T> = List<PopupMenuEntry<T>> Function(BuildContext context);
List<PopupMenuItem<String>> _buildPopMenuItem(BuildContext context) {
  return <PopupMenuItem<String>>[
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/发起群聊.png', '发起群聊'),
    _buildItem('images/发起群聊.png', '发起群聊'),
  ];
}

class _ChatPageState extends State<ChatPage>
with AutomaticKeepAliveClientMixin<ChatPage>{
  List<Chat> _datas = [];

  bool _cancelConnect = false;


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    getDatas();
    getDatas().then((List<Chat> datas) {
      if(!_cancelConnect) {
        setState(() {
          _datas = datas;
        });
      }
    }).catchError((e) {}).whenComplete(() {
      print('完毕');
    }).timeout(Duration(seconds: 30)).catchError((timeout){
      _cancelConnect = true;
      print('超时：$timeout');
    });
  }

  Future<List<Chat>> getDatas() async {
    _cancelConnect = false;
    var url =
        Uri.parse('http://rap2api.taobao.org/app/mock/283838/api/chat/list');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      //获取网络数据   转换模型
      final resonseBody = json.decode(response.body);
//      List<Chat> chatList = resonseBody['chat_list'].map<Chat>((item)=>Chat.formJson(item)).toString() as List<Chat>;
      List<Chat> chatList = resonseBody['chat_list']
          .map<Chat>((item) => Chat.formJson(item))
          .toList();
      return chatList;
    } else {
      throw Exception('statusCode:${response.statusCode}');
    }
  }
  Widget _builbItemForRow (BuildContext context, int index) {
    if(index==0){
      return SearchCell(datas: _datas,);
    }else{
      return ListTile(
        title: Text(_datas[index].name),
        subtitle: Container(
          height: 20,
          child: Text(_datas[index].message),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_datas[index].imageUrl),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: WeChatBGThemeColor,
          centerTitle: true, //针对安卓
          title: Text('微信'),
          actions: [
            Container(
              margin: EdgeInsets.all(10),
              child: PopupMenuButton(
                offset: Offset(0, 60),
                itemBuilder: _buildPopMenuItem,
                child: Image(image: AssetImage('images/圆加.png')),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: _builbItemForRow,
        ));
  }

}




/**
 * FutureBuilder(
    future: getDatas(),
    builder: (BuildContext context,AsyncSnapshot snapshot){
    print(snapshot.data);
    print(snapshot.connectionState);
    if(snapshot.connectionState == ConnectionState.waiting){
    return Center(child: Text('loading.....'),);
    }else{
    return ListView(
    children: snapshot.data.map<Widget>((item){
    return ListTile(
    title: Text(item.name),
    subtitle: Container(height: 20,child: Text(item.message),),
    leading: CircleAvatar(
    backgroundImage: NetworkImage(item.imageUrl),
    ),

    );
    }).toList(),
    );
    }

    return Container(color: Colors.red,);


    },
    )
 *
 *
 */
