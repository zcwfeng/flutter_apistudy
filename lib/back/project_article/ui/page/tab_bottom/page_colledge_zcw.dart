import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/tab_bottom/page_collect_1.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/tab_bottom/page_collect_2.dart';

class ColledgePagez extends StatefulWidget {
  @override
  _ColledgePageStatez createState() => _ColledgePageStatez();
}

class _ColledgePageStatez extends State<ColledgePagez> {
  int _curPage = 0;
  bool _isHidden = false;

  //收藏
  List _collects;

  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    super.initState();

    pages..add(ColledgePageChapter())..add(ColledgePageChapter2());

    _getCollects();
  }

  void _getCollects() async {
    var data = await Api.getArticleList(_curPage);
    _isHidden = true;
    _collects = data['datas'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的收藏"),
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.widgets,
                    color: _bottomNavigationColor,
                  ),
                  title: Text(
                    'collect',
                    style: TextStyle(
                        color: _bottomNavigationColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                    color: _bottomNavigationColor,
                  ),
                  title: Text(
                    'NEWS',
                    style: TextStyle(
                        color: _bottomNavigationColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  )),
            ],
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index;
              });
            })
//      body: Stack(
//        children: <Widget>[
//          Offstage(
//            offstage: _isHidden,
//            child: Center(
//              child: CircularProgressIndicator(),
//            ),
//          ),
//          Offstage(
//            ///如果请求到了收藏数据并且不为空就隐藏，否则显示
//            offstage: _collects?.isNotEmpty ?? !_isHidden,
//            child: Center(
//              child: Text("(＞﹏＜) 你还没有收藏任何内容......"),
//            ),
//          )
//        ],
//      ),
        );
  }
}
