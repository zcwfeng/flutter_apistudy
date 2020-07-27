import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  CurvedAnimation curveAnimation;

  Animation<double> tween;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    tween = Tween(begin: 100.0, end: 300.0).animate(curveAnimation);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("动画"),
            ),
//          body: MyAnimatedWidget(tween)),
            body: AnimatedBuilder(child: Text("animations"),animation: tween,builder: (context,child){
              return Container(
                width: tween.value,
                height: tween.value,
                color: Colors.red,
//                child: Text("animations"),
              );
            })
        )
    );
  }
}

class MyAnimatedBuilder extends AnimatedBuilder {}

class MyAnimatedWidget extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Container(
      width: animation.value,
      height: animation.value,
      color: Colors.red,
      child: Text("animations"),
    );
  }

  MyAnimatedWidget(Animation animation) : super(listenable: animation);
}
