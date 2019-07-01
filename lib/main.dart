import 'package:flutter/material.dart';
import 'dart:async';
import 'page/Home.dart';
import 'page/Second.dart';
import 'page/Third.dart';
import 'page/Fouth.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: BottomNavigationWidget(),
  ));
}

//dev
class BottomNavigationWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();
  bool showAd = true;
  @override
  void initState() {
    super.initState();
    pages
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AlarmsScreen())
      ..add(ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Offstage(
            offstage: showAd,
            child: Scaffold(
              body: pages[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: _bottomNavigationColor,
                      ),
                      title: Text(
                        'HOME',
                        style: TextStyle(color: _bottomNavigationColor),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.email,
                        color: _bottomNavigationColor,
                      ),
                      title: Text(
                        'Email',
                        style: TextStyle(color: _bottomNavigationColor),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.pages,
                        color: _bottomNavigationColor,
                      ),
                      title: Text(
                        'PAGES',
                        style: TextStyle(color: _bottomNavigationColor),
                      )),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.airplay,
                        color: _bottomNavigationColor,
                      ),
                      title: Text(
                        'AIRPLAY',
                        style: TextStyle(color: _bottomNavigationColor),
                      )),
                ],
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Offstage(
            offstage: !showAd,
            child: Material(
              child:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                borderRadius: BorderRadius.circular(3.0), //3像素圆角
                boxShadow: [ //阴影
                  BoxShadow(
                      color:Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/14101776?v=4"),
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //     color: Colors.white70,
                    // ),
                    child: Text('猫舍',style: Theme.of(context).primaryTextTheme.title),
                  ),
                  CountDownWidget(
                      onCountDownFinishCallBack: (bool value) {
                                        if (value) {
                                          setState(() {
                                            showAd = false;
                                          });
                                        }
                                      },
                    )
                  ],
              )
            )
            ),


          )
        ],
    );
  }
}



class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 3;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 0.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}