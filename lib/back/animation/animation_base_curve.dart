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
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      print(status);
      if(status == AnimationStatus.completed){
        animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        animationController.forward();
      }
    });

    curveAnimation = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    tween = Tween(begin: 100.0,end: 300.0).animate(curveAnimation);

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
          body: Container(
            width: tween.value,
            height: tween.value,
            color: Colors.red,
            child: Text("animations"),
          )),
    );
  }
}



