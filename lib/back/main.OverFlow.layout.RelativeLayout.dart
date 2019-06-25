import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _containerHeight = 120, _imageHeight = 80, _iconTop = 44, _iconLeft = 12, _marginLeft = 110;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            height: _containerHeight,
            child: Container(color: Colors.blue),
          ),
          Positioned(
            left: _iconLeft,
            top: _iconTop,
            child: Icon(Icons.settings, color: Colors.white),
          ),
          Positioned(
            right: _iconLeft,
            top: _iconTop,
            child: Icon(Icons.bubble_chart, color: Colors.white),
          ),
          Positioned(
            left: _iconLeft,
            top: _containerHeight - _imageHeight / 2,
            child: ClipOval(child: Image.asset("assets/images/profile.jpg", fit: BoxFit.cover, height: _imageHeight, width: _imageHeight)),
          ),
          Positioned(
            left: _marginLeft,
            top: _containerHeight - (_imageHeight / 2.5),
            child: Text("CopsOnRoad", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
          ),
          Positioned.fill(
            left: _marginLeft,
            top: _containerHeight + (_imageHeight / 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Gold", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("22", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Silver", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("28", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Bronze", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
