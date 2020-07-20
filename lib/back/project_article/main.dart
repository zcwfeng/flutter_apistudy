import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/manager/app_manager.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_splash.dart';
import 'package:flutter_apistudy/back/project_article/ui/widget/main_drawer.dart';
import 'ui/page/page_article.dart';

void main() => runApp(ArticleApp());

class ArticleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => SplashPage(),
      },
    );
//    AppManager.initApp();
//    return MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(
//            title: Text("文章", style: const TextStyle(color: Colors.white)),
//          ),
//          drawer: Drawer(
//            child: MainDrawer(),
//          ),
//          body: ArticlePage(),
//        ));
  }
}
