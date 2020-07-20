import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/event/login_event.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/manager/app_manager.dart';
import 'package:flutter_apistudy/back/project_article/ui/widget/article_item.dart';

class ArticleCollectPage extends StatefulWidget {
  @override
  _ArticleCollectPageState createState() => _ArticleCollectPageState();
}

class _ArticleCollectPageState extends State<ArticleCollectPage>
    with AutomaticKeepAliveClientMixin {
  bool _isHidden = false;

  //收藏
  List _collects = [];
  ScrollController _scrollController = ScrollController();
  int _curPage = 0;
  int _pageCount;
  StreamSubscription<CollectEvent> collectEventListen;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      ///获得 SrollController 监听控件可以滚动的最大范围
      var maxScroll = _scrollController.position.maxScrollExtent;

      ///获得当前位置的像素值
      var pixels = _scrollController.position.pixels;

      ///当前滑动位置到达底部，同时还有更多数据
      if (maxScroll == pixels && _curPage < _pageCount) {
        _getCollects();
      }
    });

    collectEventListen = AppManager.eventBus.on<CollectEvent>().listen((event) {
      //页面没有被dispose
      if (mounted) {
        // 取消收藏
        if (!event.collect) {
          _collects.removeWhere((item) {
            return item['id'] == event.id;
          });
        }
      }
    });
    _getCollects();
  }

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: <Widget>[
          Offstage(
            offstage: _isHidden,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Offstage(

            ///如果请求到了收藏数据并且不为空就隐藏，否则显示
            offstage: _collects.isNotEmpty ?? !_isHidden,
            child: Center(
              child: Text("(＞﹏＜) 你还没有收藏任何内容......"),
            ),
          ),
          Offstage(
            offstage: _collects.isEmpty,
            child: RefreshIndicator(
              onRefresh: ()=>_getCollects(true),
              child: ListView.builder(
                  //总是能滑动，因为数据少，listview无法滑动，
                  //RefreshIndicator 就无法更新
                  physics:AlwaysScrollableScrollPhysics(),
                  itemCount: _collects.length,
                  itemBuilder: (context,i)=>_buildItem(i)
              ),
            ),
          )
        ],
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _getCollects([bool refresh = false]) async {
    if (refresh) {
      _curPage = 0;
    }
    var result = await Api.getArticleCollects(_curPage);

    if (result != null) {
      if (_curPage == 0) {
        _collects.clear();
      }

      _curPage++;
      var data = result['data'];
      _pageCount = data['pageCount'];
      _collects.addAll(data['datas']);
      _isHidden = true;
      setState(() {});
    }
  }

  // 避免重复调用initState
  @override
  bool get wantKeepAlive => true;

  _buildItem(int i) {
    //只搜藏站内
    _collects[i]['id'] = _collects[i]['originId'];
    _collects[i]['collect'] = true;
    return ArticleItem(_collects[i]);

  }
}
