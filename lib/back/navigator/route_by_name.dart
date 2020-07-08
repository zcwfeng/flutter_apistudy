import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
//      home: MainRoute(),
      routes: {
        "/": (_) => MainRoute(),
        "new_page":(_) => SecondRoute()
      },
    );
  }
}

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () async{
              //导航到新路由
              var result = await Navigator.pushNamed(context, "new_page",arguments: "传值");
              debugPrint("返回:$result");// 相当与onActivityResult----> 第一个页面挂起，再次启用才会打印
            },
            child: Text("进入第二页"),
          )
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 接受参数
    dynamic obj = ModalRoute.of(context).settings.arguments;
    if(obj!= null) {
      debugPrint("传过来的参数:$obj");
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Column(
        children: <Widget>[
          Text("第一个页面"),
          RaisedButton(
            onPressed: () {
              //路由pop弹出
              Navigator.pop(context,["结束","lll"]);
            },
            child: Text("返回"),
          )
        ],
      ),
    );
  }
}