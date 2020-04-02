import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import './box-game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

  

  

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    Util flameUtil = Util();
   flameUtil.fullScreen();
    flameUtil.setOrientation(DeviceOrientation.portraitUp);

    BoxGame game = BoxGame();
    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:game.widget
    );
  }
}