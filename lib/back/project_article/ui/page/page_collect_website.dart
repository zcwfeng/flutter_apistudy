import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_collect_add_website.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

class WebsiteCollectPage extends StatefulWidget {
  @override
  _WebsiteCollectPageState createState() => _WebsiteCollectPageState();
}

class _WebsiteCollectPageState extends State<WebsiteCollectPage>
    with AutomaticKeepAliveClientMixin {
  bool _isHidden = false;

  //收藏
  List _collects = [];

  @override
  void initState() {
    super.initState();
    debugPrint("左右滑动页面website--->initState");
    _getCollects();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            onRefresh: () => _getCollects(),
            child: ListView.separated(
              //总是能滑动，因为数据少，listview无法滑动，
              //RefreshIndicator 就无法更新
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: _collects.length,
              itemBuilder: (context, i) => _buildItem(context,i),
              separatorBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Divider(color: Colors.grey),
                );
              },
            ),
          ),
        ),
        Positioned(
            bottom: 18.0,
            right: 18.0,
            child: FloatingActionButton(
                child: Icon(Icons.add), onPressed: _addCollect))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  _getCollects() async {
    var result = await Api.getWebSiteCollects();
    if (result != null) {
      _collects.clear();
      var data = result['data'];
      _collects.addAll(data);
      _isHidden = true;
      setState(() {});
    }
  }

  _buildItem(BuildContext context,int i) {
    var item = _collects[i];
    return Slidable(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item["name"], style: TextStyle(fontSize: 22.0)),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                item['link'],
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
        secondaryActions: [
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: "删除",
            onTap: () => _delCollect(item),
          )
        ],
        actionPane: SlidableDrawerActionPane());
  }

  _addCollect() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (_) => WebsiteAddPage()));
    if (result != null) {
      _collects.add(result);
      setState(() {

      });
    }
  }

  _delCollect(item) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    var result = await Api.unCollectWebsite(item['id']);
    Navigator.pop(context);

    if (result['errorCode'] != 0) {
      Toast.show(result['errorMsg'], context, gravity: Toast.CENTER);
    } else {
      setState(() {
        _collects.remove(item);
      });
    }
  }
}
