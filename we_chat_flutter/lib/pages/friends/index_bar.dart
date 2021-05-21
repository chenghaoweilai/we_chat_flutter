import 'package:flutter/material.dart';

import '../uset_const.dart';

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class IndexBar extends StatefulWidget {
  final void Function(int index) indexBarCallBack;

  const IndexBar({Key key, this.indexBarCallBack}) : super(key: key);
  @override
  _IndexBarState createState() => _IndexBarState();
}


int getIndex(BuildContext context,Offset globalPosition){
  RenderBox box = context.findRenderObject();
  double udy = box.globalToLocal(globalPosition).dy;
  var itemHeight = ScreenHeight(context)/2/INDEX_WORDS.length;
  int index = (udy~/itemHeight).clamp(0, INDEX_WORDS.length-1);
  return index;
}

class _IndexBarState extends State<IndexBar> {
  Color _backGroudColor = Color.fromRGBO(1, 1, 1, 0.0);
  Color _textColor = Colors.black;
  int _selectIndex = -1;


  double _indicatorY = 0.0;
  String _indicatorText = 'A';
  bool _indicatorHidden = true;

  @override
  Widget build(BuildContext context) {
    List <Widget> words = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      words.add(Expanded(
        child: Text(INDEX_WORDS[i], style: TextStyle(fontSize: 10,color: _textColor),),));
    }
    return Positioned(
      right: 0.0,
      height: ScreenHeight(context) / 2.0,
      top: ScreenHeight(context) / 8,
      width: 120,
      child: Row(
        children: [
          Container(
            width: 100,
            alignment: Alignment(0, _indicatorY),
            child: _indicatorHidden == true ?null:Stack(
              alignment: Alignment(-0.2, 0),
              children: [
                Image(image: AssetImage('images/气泡.png'),width: 60,),
                Text('$_indicatorText',style: TextStyle(color: Colors.white,fontSize: 35),),
              ],
            ),
          ),
          Container(
              color: _backGroudColor,
              width: 20,
              child: GestureDetector(
                child: Column(children: words,),

                onVerticalDragUpdate: (DragUpdateDetails details){
                  int index = getIndex(context, details.globalPosition);


//              print(details.globalPosition);
                //计算外界回调
                  if(index != _selectIndex){
                    _selectIndex = index;
                    setState(() {});
                    widget.indexBarCallBack(index);
                  }
                  //内部气泡显示
                  _indicatorText = INDEX_WORDS[index];
                  _indicatorY = (2.2/(INDEX_WORDS.length-1)*index-1.1);
                  _indicatorHidden = false;

                },


                onVerticalDragDown: (DragDownDetails details){

                  if(getIndex(context, details.globalPosition) != _selectIndex) {
                    widget.indexBarCallBack(getIndex(context, details.globalPosition));
                  }
                  _backGroudColor = Color.fromRGBO(1, 1, 1, 0.3);
                  _textColor = Colors.white;
                  setState(() {});
                },
                onVerticalDragEnd: (DragEndDetails details){
                  _indicatorHidden = true;
                  _backGroudColor = Color.fromRGBO(1, 1, 1, 0.0);
                  _textColor = Colors.black;
                  setState(() {});
                },
              ))
        ],
      ),
      
    );
  }
}
