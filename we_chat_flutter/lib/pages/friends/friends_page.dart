import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat_flutter/pages/discover/discover_child_page.dart';
import '../uset_const.dart';
import 'friends_data.dart';
import 'index_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
with AutomaticKeepAliveClientMixin<FriendsPage>{
  ScrollController _scrollController;
  final List <Friends>_listData = [];
  final Map _groupOffMap = {
    INDEX_WORDS[0] : 0.0,
    INDEX_WORDS[0] : 0.0,

  };
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    items.add((items.length+1).toString());
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listData..addAll(datas)..addAll(datas);
    _listData.sort((Friends a,Friends b){
      return a.indexLetter.compareTo(b.indexLetter);
    });
    _scrollController = ScrollController();
    var _groupOffSet = 54*4.0;
    for(int i = 0;i<_listData.length;i++){
      if(i<1){
        _groupOffMap.addAll({_listData[i].indexLetter:_groupOffSet});
        _groupOffSet += 84;
      }else if(_listData[i].indexLetter==_listData[i-1].indexLetter){
        _groupOffSet += 54;
      }else{
        _groupOffMap.addAll({_listData[i].indexLetter:_groupOffSet});
        _groupOffSet += 84;
      }
    }

  }

  final List<Friends> _headerData = [
    Friends(imageAssets: 'images/群聊.png', name: '新朋友1'),
    Friends(imageAssets: 'images/群聊.png', name: '新朋友2'),
    Friends(imageAssets: 'images/群聊.png', name: '新朋友3'),
    Friends(imageAssets: 'images/群聊.png', name: '新朋友4'),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    if (index < _headerData.length) {
      return _FriendCell(
        imageAssets: _headerData[index].imageAssets,
        name: _headerData[index].name,
      );
    }
    if(index>4 && _listData[index - 4].indexLetter == _listData[index - 5].indexLetter){
      return _FriendCell(
        imageUrl: _listData[index - 4].imageUrl,
        name: _listData[index - 4].name,
      );
    }else{
      return _FriendCell(
        imageUrl: _listData[index - 4].imageUrl,
        name: _listData[index - 4].name,
        indexLetter: _listData[index - 4].indexLetter,
      );
  }

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: WeChatBGThemeColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: WeChatBGThemeColor,
        title: Text('联系人'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DisCoverChildPage(
                        title: '添加朋友',
                      )));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => DisCoverChildPage(
                        title: '添加朋友',
                      )));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage('images/icon_friends_add.png'),
                width: 25,
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Center(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context,LoadStatus mode){
                Widget body ;
                if(mode==LoadStatus.idle){
                  body =  Text("pull up load");
                }
                else if(mode==LoadStatus.loading){
                  body =  CupertinoActivityIndicator();
                }
                else if(mode == LoadStatus.failed){
                  body = Text("Load Failed!Click retry!");
                }
                else if(mode == LoadStatus.canLoading){
                  body = Text("release to load more");
                }
                else{
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _listData.length + _headerData.length,
              itemBuilder: _itemForRow,
            ),
          ),
        ),
        IndexBar(indexBarCallBack: (int index){
          if(_groupOffMap[INDEX_WORDS[index]] != null){
            _scrollController.animateTo(_groupOffMap[INDEX_WORDS[index]], duration: Duration(milliseconds: 100), curve: Curves.easeIn);
          }
          print('收到----$index');
        },),
      ],)
    );
  }
}

class _FriendCell extends StatelessWidget {
  _FriendCell({
    this.name,
    this.imageUrl,
    this.imageAssets,
    this.indexLetter,
  });

  final String name;
  final String imageUrl;
  final String imageAssets;
  final String indexLetter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(child: Text(indexLetter!=null?indexLetter:''),color: Colors.grey,height: indexLetter != null ?30:0,alignment: Alignment.centerLeft,padding: EdgeInsets.only(left: 10),),
          Container(child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    image: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : AssetImage(imageAssets),
                  ),
                ),
              ),
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 18),
                        ),
                        width: ScreenWidth(context) - 100,
                        height: 53.5,
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: 0.5,
                        width: ScreenWidth(context) - 100,
                        color: WeChatBGThemeColor,
                      ),
                    ],
                  )),
            ],
          ),),
        ],
      )
    );
  }
}



