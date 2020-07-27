import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(lowerBound:100,upperBound:300,duration: Duration(seconds: 3), vsync: this);
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
            width: animationController.value,
            height: animationController.value,
            color: Colors.red,
            child: Text("animations"),
          )),
    );
  }
}



