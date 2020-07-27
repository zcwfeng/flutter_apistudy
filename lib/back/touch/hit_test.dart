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
      body: Listener(
        behavior: HitTestBehavior.translucent,
        child: Container(
          alignment: Alignment.center,
          ///300x150不可见，只有Text可见
          ///默认情况下，点击Text区域才响应事件。点击空白区域无输出;点击Text才能响应
          ///设置为 opaque 后 则在300x300内都能响应，哪怕不可见。点击空白区域就能响应
          ///设置为 translucent 后 则在300x300能响应。也是点击空白区域就能响应
//            color: Colors.blue,///不设置颜色就是不可见
          width: 300.0,
          height: 300.0,
          child: Text(
            "点击",
          ),
        ),
        onPointerDown: (PointerDownEvent event) =>
            setState(() => debugPrint("响应")),
      ),
    );
  }
}


