import 'package:flutter/material.dart';
import 'package:we_chat_flutter/pages/chat/search_page.dart';

import '../uset_const.dart';
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SearchPage()));


//        Navigator.of(context).push(
//            MaterialPageRoute(builder: (BuildContext context)=>SearchPage())
//        );

      },
      child: Container(
//        height: 44,
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