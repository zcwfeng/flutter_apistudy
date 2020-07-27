import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;
//  Tween<Color> tween;
////  Animation<Color> colorAnimation;
    Tween<MyValue> tween;
  Animation<MyValue> valueAnimation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
//        lowerBound: 100,
//        upperBound: 300,
        duration: Duration(seconds: 3),
        vsync: this);
    animationController.addListener(() {
      setState(() {});
      print(animationController.value);
    });
    tween = MyValueTween(begin: MyValue(10.0), end: MyValue(11.0));
    valueAnimation = tween.animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    MyValue value = valueAnimation.value;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("动画"),
          ),
          body: Container(
            width: value.value,
            height: value.value,
            color: Colors.red,
//            width: 100,
//            height: 100,
//            color: colorAnimation.value,
            child: Text("animations"),
          )),
    );
  }
}

class MyColorTween extends Tween<Color> {
  MyColorTween({Color begin, Color end}) : super(begin: begin, end: end);

  @override
  Color lerp(double t) {
    return Colors.black;
  }
}


class MyValueTween extends Tween<MyValue>{
  MyValueTween({MyValue begin, MyValue end}) : super(begin: begin, end: end);

  @override
  MyValue lerp(double t) {
    return MyValue(begin.value + t* 1000);
  }
}

class MyValue {
  double value;
  MyValue(this.value);
}
