import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter Demo',
      home: MainRoute(),
    );
  }
}

class MainRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
        body: Stack(
          children: <Widget>[
            Listener(
              child: Container(
                width: 500.0,
                height: 500.0,
                color: Colors.red,
                child: Center(child: Text("最里部")),
              ),
              onPointerDown: (event) => print("最里部"),
            ),
            Listener(
              child: Container(
                width: 300.0,
                height: 300.0,
//                color: Colors.blue,
                child: Center(child: Text("底部")),
              ),
              onPointerDown: (event) => print("底部"),
              behavior: HitTestBehavior.translucent,
            ),
            Listener(
              ///点击的时候 如果Widget是透明的 就让他半透明
              ///能够在透明的区域 穿透 事件，在下一层获得.
              ///点击文字不会穿透，因为文字不是透明的
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
                child: Center(child: Text("外部")),
              ),
              onPointerDown: (event) => print("外部"),
              behavior: HitTestBehavior.translucent, //穿透
            )
          ],
        ));
  }
}
