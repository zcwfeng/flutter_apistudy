import 'package:flutter/material.dart';
import 'dart:math';
import '../../utils/NetUtil.dart';
import '../../data/entity.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestDemo(),
    );
  }
}

class TestDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestDemoState();
  }
}

class _TestDemoState extends State<TestDemo>
    with SingleTickerProviderStateMixin {

  Data pageData;
  TabController mController;
  List<String> tabTitles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarView(),
      body: _tabBarView(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  @override
  void initState() {
    super.initState();
    tabTitles = [
          '科技',
          '汽车',
          '财经',
          '八卦',
          '军事',
          '娱乐',
          '头条'
    ];

    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );


    getContent();
  }

  Widget _appBarView() {
    return AppBar(
      title: Text("TabBar & TabBarView",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      elevation: 0,
      bottom: _tabBar(),
    );
  }

  Widget _tabBar() {
    return TabBar(
        //设置tab是否可水平滑动
        isScrollable: true,
        //控制器
        controller: mController,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.black,
        //设置tab未选中得颜色
        unselectedLabelColor: Colors.black45,
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        //若不需要自定义，可直接通过
        //indicatorColor 设置指示器颜色
        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式
        indicator: UnderlineTabIndicator(
            // strokeCap: StrokeCap.round,
            insets: EdgeInsets.only(left: 15, right: 15),
            borderSide: BorderSide(width: 4.0, color: Colors.red)),
        tabs: tabTitles.map((item) {
          return Tab(text: item);
        }).toList());


  }



  Widget _tabBarView() {
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    setState(() {
      print("tabBarView....................setState");
    });
    return TabBarView(
      controller: mController,
      children: tabTitles.map((item) {
        return Container(
          color: _getColor(),
          child: ListView.separated(
                // itemCount: widgets.length,
                itemCount: 10,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position,context);
                },
                //分割器构造器
                separatorBuilder: (BuildContext context, int index) {
                  return index%2==0?divider1:divider2;
                },
            ),
        );
      }).toList(),
    );
  }

  Color _getColor() {
    var random = new Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    // print(r);
    // print(g);
    // print(b);
    return Color.fromARGB(255, r, g, b);
  }



  //获取网络数据,这个接口可能会过一段时间就发生变化,用的别人接口
  void getContent() {
    NetUtil.get("http://www.mocky.io/v2/5d1f0d71310000d858ebea3f", (data) {
      print("neUtils....................setState");

      Entity user = Entity.fromJson(data);
      setState(() {
          pageData = user.data;
          print("getContent....................setState");

      });
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
  }


  Widget getRow(int i,BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(i.toString(),textAlign: TextAlign.center)),
      onTap: () {

      },
    );
  }
}

