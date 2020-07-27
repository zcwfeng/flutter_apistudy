import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        // actions: <Widget>[
        //       SizedBox(
        //           width: 20,
        //           height: 20,
        //           child: CircularProgressIndicator(
        //               strokeWidth: 3,
        //               valueColor: AlwaysStoppedAnimation(Colors.white70),
        //           ),
        //       )
        // ],


        actions: <Widget>[
            UnconstrainedBox(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(Colors.white70),
                    ),
                ),
            )
        ],
      ),

      body:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
                constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
                decoration: BoxDecoration(//背景装饰
                    gradient: RadialGradient( //背景径向渐变
                        colors: [Colors.red, Colors.orange],
                        center: Alignment.topLeft,
                        radius: .98
                    ),
                    boxShadow: [ //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0
                      )
                    ]
                ),
                transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                alignment: Alignment.center, //卡片内文字居中
                child: Text( //卡片文字
                  "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text("Hello world!"),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Hello world!"),
                ),
              ),

              Container(
                margin: EdgeInsets.all(20.0), //容器外补白
                color: Colors.orange,
                child: Text("Hello world!"),
              ),
              Container(
                padding: EdgeInsets.all(20.0), //容器内补白
                color: Colors.orange,
                child: Text("Hello world!"),
              ),

              DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(10.0), //3像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black87,
                          offset: Offset(2.0,2.0),
                          blurRadius: 4.0
                      )
                    ]
                  ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                )
              ),

              // ConstrainedBox(
              //   constraints: BoxConstraints(
              //     minWidth: double.infinity, //宽度尽可能大
              //     minHeight: 50.0 //最小高度为50像素
              //   ),
              //   child: Container(
              //       height: 5.0,
              //       child: redBox
              //   ),
              // ),

              // SizedBox(
              //   width: 80.0,
              //   height: 80.0,
              //   child: redBox
              // ),

              // ConstrainedBox(
              //   // constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
              //   constraints: BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0),
              //   child: redBox,
              // ),

              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                    child: redBox,
                  )
              ),

              ConstrainedBox(

                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                  child: UnconstrainedBox( //“去除”父级限制
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                      child: redBox,
                    ),
                  )
              ),
              Padding(
                  //上下左右各添加16像素补白
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    //显式指定对齐方式为左对齐，排除对齐干扰
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          //左边添加8像素补白
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Hello world"),
                    ),
                    Padding(
                      //上下各添加8像素补白
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("I am Jack"),
                    ),
                    Padding(
                      // 分别指定四个方向的补白
                      padding: const EdgeInsets.fromLTRB(20.0,.0,20.0,20.0),
                      child: Text("Your friend"),
                    )
                  ],
                )
              )

      ],
    )

    );
  }
}
