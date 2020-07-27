import 'package:flutter/material.dart';

void main() => runApp(PointEventApp());

class PointEventApp extends StatefulWidget {
  @override
  _PointEventAppState createState() => _PointEventAppState();
}

class _PointEventAppState extends State<PointEventApp> {
  var _event;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("原始事件"),),
        body: Listener(
          child: Container(
            alignment: Alignment.center,
            width: 300.0,
            height: 150.0,
            color: Colors.red,
            child: Text(_event?.toString() ?? ""),
          ),
          onPointerDown: (PointerDownEvent event) =>
              setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) =>
              setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
        ),
      ),
    );
  }
}