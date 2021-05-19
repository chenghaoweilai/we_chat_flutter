import 'package:flutter/material.dart';

class DisCoverChildPage extends StatefulWidget {
  final String title;

  const DisCoverChildPage({Key key, this.title}) : super(key: key);
  @override
  _DisCoverChildPageState createState() => _DisCoverChildPageState();
}

class _DisCoverChildPageState extends State<DisCoverChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }
}
