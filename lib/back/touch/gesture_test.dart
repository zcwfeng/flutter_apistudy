import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
        body: _Drag(),
      ),
    );
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
                print("left:$_left----top:$_top");

              });
            },
            onTapUp: (_) {
              print("onTapUP");
            },
            onPanEnd: (_) {
              print("onPanDown");
            },
            onHorizontalDragEnd: (_) {
              print("onHorizontalDragDown");
            },
//            onVerticalDragEnd: (_) {
//              print("onVerticalDragDown");
//            }
          ),
        )
      ],
    );
  }
}
