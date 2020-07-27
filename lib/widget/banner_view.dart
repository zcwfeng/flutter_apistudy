import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(BannerTest());

class BannerTest extends StatefulWidget {
  @override
  _BannerTestState createState() => _BannerTestState();
}

class _BannerTestState extends State<BannerTest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test Custom BannerView"),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Container(
                  height: 180.0,
                  child: BannerView(
                    chidren: [
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
                          fit: BoxFit.cover),
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png",
                          fit: BoxFit.cover),
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/ab17e8f9-6b79-450b-8079-0f2287eb6f0f.png",
                          fit: BoxFit.cover),
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/fb0ea461-e00a-482b-814f-4faca5761427.png",
                          fit: BoxFit.cover),
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png",
                          fit: BoxFit.cover),
                      Image.network(
                          "https://www.wanandroid.com/blogimgs/00f83f1d-3c50-439f-b705-54a49fc3d90d.jpg",
                          fit: BoxFit.cover)
                    ],
                  ),
                );
              } else {
                return Text("111");
              }
            }),
      ),
    );
  }
}

class BannerView extends StatefulWidget {
  final List<Widget> chidren;

  final Duration switchDuration;

  BannerView(
      {this.chidren = const <Widget>[],
      this.switchDuration = const Duration(seconds: 3)});

  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _curPageIndex;
  static const Duration animateDuration = const Duration(milliseconds: 500);
  Timer _timer;
  List<Widget> children = []; // 内部加两个页面  +B(A,B)+A

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _curPageIndex = 0;
    _tabController = TabController(length: widget.chidren.length, vsync: this);

    children.addAll(widget.chidren);

    /// 定时器完成自动翻页
    if (widget.chidren.length > 1) {
      children.insert(0, widget.chidren.last);
      children.add(widget.chidren.first);

      ///如果大于一页，则会在前后都加一页， 初始页要是 1
      _curPageIndex = 1;
      _timer = Timer.periodic(widget.switchDuration, _nextBanner);
    }

    ///初始页面 指定
    _pageController = PageController(initialPage: _curPageIndex);
  }

  void _nextBanner(Timer timer) {
    _curPageIndex++;
    _curPageIndex = _curPageIndex == children.length ? 0 : _curPageIndex;
    _pageController.animateToPage(_curPageIndex,
        duration: animateDuration, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          onPointerDown: (_) {
            _timer?.cancel();
          },
          onPointerUp: (_) {
            if (widget.chidren.length > 1) {
              _timer = Timer.periodic(widget.switchDuration, _nextBanner);
            }
            print("重启");
          },
          child: NotificationListener(

            // ignore: missing_return
            onNotification: (notification){
//              print(notification.runtimeType);
              if(notification is ScrollUpdateNotification){
                //是一个完整页面的偏移
                if(notification.metrics.atEdge) {
                  if (_curPageIndex == children.length - 1) {
                    ///如果是最后一页 ，让pageview jump到第1页
                    _pageController.jumpToPage(1);
                  } else if (_curPageIndex == 0) {
                    ///第1页回滑， 滑到第0页。第0页的内容是倒数第二页，是所有真实页面的最后一页的内容
                    ///指示器 到 tab的最后一个
                    _pageController.jumpToPage(children.length-2);
                  }
                }

              }
            },
            child: PageView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: children[index],
                  onTap: () {
                    print("$index");
                  },
                );
              },
              controller: _pageController,

              ///要到新页面的时候 把新页面的index给我们
              onPageChanged: (index) {
                // 需要更新下下标
                _curPageIndex = index;
                if (index == children.length - 1) {
                  ///如果是最后一页 ，让pageview jump到第1页
//                _pageController.jumpToPage(1);
                  _tabController.animateTo(0);
                } else if (index == 0) {
                  ///第1页回滑， 滑到第0页。第0页的内容是倒数第二页，是所有真实页面的最后一页的内容
                  ///指示器 到 tab的最后一个
//                _pageController.jumpToPage(children.length-2);
                  _tabController.animateTo(_tabController.length - 1);
                } else {
                  _tabController.animateTo(index - 1);
                }
              },
            ),
          ),
        ),
        Positioned(
          child: TabPageSelector(
            controller: _tabController,
            color: Colors.white,
            selectedColor: Colors.grey,
          ),
          bottom: 8.0,
          right: 8.0,
        )
      ],
    );
  }
}
