import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/event/login_event.dart';
import 'package:flutter_apistudy/back/project_article/http/api.dart';
import 'package:flutter_apistudy/back/project_article/manager/app_manager.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_colledge.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_login.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String _username;

  @override
  void initState() {
    super.initState();
    // 监听特定LoginEvent
    AppManager.eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        _username = event.username;
        AppManager.prefs.setString(AppManager.ACCOUNT, _username);
      });
    });
    _username = AppManager.prefs.getString(AppManager.ACCOUNT);
  }

  void _itemClick(Widget page) {
    // 如果未登录进入登陆页面
    var dstPage = _username == null ? LoginPage() : page;
    // 如果page 为null跳转
    if (dstPage != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return dstPage;
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget userHeader = DrawerHeader(
      decoration: BoxDecoration(color: Colors.blue),
      child: InkWell(
        onTap: () {
          _itemClick(null);
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/logo.png"),
                radius: 38.0,
              ),
            ),
            Text(
              _username ?? '清先登陆',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
    return ListView(
      ///不设置会导致状态栏灰色
      padding: EdgeInsets.zero,
      children: [
        userHeader,
        InkWell(
          onTap: () {
            _itemClick(ColledgePage());
          },
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              '收藏列表',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
          child: Divider(color: Colors.grey),
        ),
        Offstage(
            offstage: _username == null,// 是否隐藏
            child: InkWell(
              onTap: (){
                setState(() {
                  AppManager.prefs.setString(AppManager.ACCOUNT,
                      null);
                  Api.clearCookie();
                  _username = null;
                });
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  '退出登陆',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            )
        )
      ],
    );
  }
}
