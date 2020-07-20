import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/main.dart';
import 'package:flutter_apistudy/back/project_article/manager/app_manager.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_article.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("images/splash.png"),
    );
  }

  void initData() async {
    Iterable<Future> futures = [
      AppManager.initApp(),
      Future.delayed(Duration(seconds: 5))
    ];
    await Future.wait(futures);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
      return ArticlePage();
    }));
  }
}
