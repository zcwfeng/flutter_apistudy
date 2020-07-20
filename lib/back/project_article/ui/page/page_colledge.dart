import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/icons.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_collect_article.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_collect_website.dart';

class ColledgePage extends StatefulWidget {
  @override
  _ColledgePageState createState() => _ColledgePageState();
}

class _ColledgePageState extends State<ColledgePage> {
  final tabs = ["文章", "网站"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("我的收藏"),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(article, size: 32)),
              Tab(icon: Icon(website, size: 32)),
            ]),
          ),
          body: TabBarView(
              children: [ArticleCollectPage(), WebsiteCollectPage()]),
        ));
  }
}
