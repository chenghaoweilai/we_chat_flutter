import 'package:flutter/material.dart';

import 'package:we_chat_flutter/pages/discover/discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Color _themColor = Color.fromRGBO(220, 220, 220, 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: _themColor,
        centerTitle: true,
        title: Text('发现'),
      ),
      body: Container(
        color: _themColor,
        height: 800,
        child: Container(
          child: ListView(
            children: <Widget>[
              DiscoverCell(
                title: '朋友圈',
                imageName: 'images/朋友圈.png',
              ),
              DiscoverCell(
                title: '朋友圈',
                imageName: 'images/朋友圈.png',

              ),
              DiscoverCell(
                title: '朋友圈',
                imageName: 'images/朋友圈.png',
              ),
            ],
            semanticChildCount: 4,
          ),
        ),
      ),
    );
  }
}
