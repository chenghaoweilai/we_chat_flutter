import 'package:flutter/material.dart';

import 'package:we_chat_flutter/pages/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  final String title;
  final String subTitle;
  final String imageName;
  final String subImageName;

  const DiscoverCell({
    Key key,
    @required this.title,
    this.subTitle,
    @required this.imageName,
    this.subImageName,
  }) : assert(title != null,'title 不能为空'),
        assert(imageName != null,'imageName 不能为空');


  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {

  Color _currendColor = Colors.white;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context){
                  return DisCoverChildPage(
                      title: widget.title
                  );
                }
            )
        );
        setState(() {
          _currendColor = Colors.white;
        });
      },
      onTapDown: (TapDownDetails details){
        setState(() {
          _currendColor = Colors.grey;
        });
      },
      onTapCancel: (){
        setState(() {
          _currendColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: _currendColor,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(widget.imageName),
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(widget.title),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('122312'),
                  Image(
                    image: AssetImage('images/badge.png'),
                    width: 10,
                  ),
                  Image(
                    height: 15,
                    image: AssetImage('images/icon_right.png',),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
