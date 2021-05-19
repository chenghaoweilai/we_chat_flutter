import 'package:flutter/material.dart';

import 'package:we_chat_flutter/pages/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', //安卓有用
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor:  Color.fromARGB(1, 0, 0, 0),
        splashColor: Color.fromARGB(1, 0, 0, 0)
      ),
      home: RootPage(),
    );
  }
}




