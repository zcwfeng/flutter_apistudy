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
        body: GradientCircularProgressRoute(),
      ),
    );
  }
}

class GradientCircularProgressRoute extends StatefulWidget {
  @override
  GradientCircularProgressRouteState createState() {
    return GradientCircularProgressRouteState();
  }
}

class GradientCircularProgressRouteState
    extends State<GradientCircularProgressRoute> {
  @override
  Widget build(BuildContext context) {
    //返回画笔
    return CustomPaint(
      painter: MyPainter(50.0),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.radius);

  double radius;

  @override
  void paint(Canvas canvas, Size size) {
    ///根据半径计算大小
    size = Size.fromRadius(radius);
    var paint = Paint() //创建一个画笔并配置其属性
      ..isAntiAlias = true //是否抗锯齿
//      ..style = PaintingStyle.stroke //画笔样式：填充
      ..style = PaintingStyle.fill
      ..color = Colors.blue //画笔颜色
      ..strokeWidth = 3.0; //画笔的宽度

    ///画一个实心圆
    Rect rect =
        Rect.fromCircle(center: size.center(Offset.zero), radius: radius);
    canvas.drawCircle(rect.center, radius, paint);
    // 贝塞尔曲线
  }

  /// 返回true来重绘，反之则应返回false不需要重绘。
  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    if (oldDelegate.radius != radius) {
      return true;
    }
    return false;
  }
}
