import 'package:flutter/material.dart';
import 'package:we_chat_flutter/pages/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(220, 220, 220, 1),
        child: Stack(
          children: [
            MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                semanticChildCount: 10,
                children: [
                  CellHeaderWidget(),
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 10,
                  ),
                  DiscoverCell(
                    title: '朋友圈',
                    imageName: 'images/朋友圈.png',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('images/相机.png'),
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('images/相机.png'),
                    height: 20,
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

class CellHeaderWidget extends StatefulWidget {
  @override
  _CellHeaderWidgetState createState() => _CellHeaderWidgetState();
}

class _CellHeaderWidgetState extends State<CellHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        child: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/汤姆.png'),
                    )),
              ), //头像
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'HHHHH',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                            height: 30,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'f微信号：123123',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 24,
                                  ),
                                ),
                                Container(
                                  child: Image(
                                    image: AssetImage(
                                      'images/icon_right.png',
                                    ),
                                  ),
                                  height: 20,
                                ),
                              ],
                            ),
                            height: 30,
                          ),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
