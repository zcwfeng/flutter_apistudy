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
  GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

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
        navigatorKey: key,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("动画"),
            ),
            body: Row(
              children: [
                Expanded(child: Text("animations")),
                InkWell(
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Hero(
                        tag: "aaa",
                        child: Image.network(
                          "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
                        ),
                      )),
                  onTap: () {
                    key.currentState.push(new MaterialPageRoute(builder: (_) {
                      return NewPage();
                    }));
                  },
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: Hero(
                    tag: "bbb",
                    child: Image.network(
                        "https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png"),

                  ),
                )
              ],
            )));
  }
}

//class NewPage extends StatefulWidget {
//  @override
//  _NewPageState createState() => _NewPageState();
//}
//
//class _NewPageState extends State<NewPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("新界面"),
//      ),
//      body: Hero(
//        tag: "aaa",
//        child: Image.network(
//          "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
//        ),
//      ),
//    );
//  }
//}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新界面"),
        ),
        body: Column(
          children: [

            Hero(
              tag: "aaa",
              child: Image.network(
                "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
              ),
            ),
            Hero(
              tag: "bbb",
              child: Image.network(
                "https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png",
              ),
            ),
          ],
        ));
  }
}
