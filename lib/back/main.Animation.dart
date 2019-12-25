import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fade Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
使用 CurvedAnimation 来实现一个曲线插值的动画。在这种情况下，控制器决定了动画进度，
CurvedAnimation 计算用于替换控制器默认线性动画的曲线值。和 Widget 一样，Flutter 中的动画效果也可以组合使用。
在构建 Widget 树的时候，你需要将 Animation 对象赋值给某个 Widget 的动画属性，
例如 FadeTransition 的不透明度属性，并让控制器开始动画。
*/
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    curve = CurvedAnimation(
        parent: controller, curve: Curves.easeIn); // controller 插值
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: FadeTransition(
            opacity: curve,
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        tooltip: 'Face',
        child: Icon(Icons.brush),
      ),
    );
  }
}
