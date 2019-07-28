import 'package:flutter/material.dart';
import '../utils/NetUtil.dart';
import '../data/entity.dart';


class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsScreenState();
}
class NewsScreenState extends State<NewsScreen> with SingleTickerProviderStateMixin{

  Data pageData;

  final List<Tab> myTabs = [];
  List<String> tabTitles;
  TabController mController;


 @override
 void dispose() {
   mController.dispose();
   super.dispose();
 }

  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabTitles.length,
      vsync: this,
    );


    getContent();

  }

  initTabData(){
    tabTitles = [
          '科技',
          '汽车',
          '财经',
          '八卦',
          '军事',
          '娱乐',
          '头条'
        ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarView(),
      body: _tabBarView(),
    );
  }



  //获取网络数据,这个接口可能会过一段时间就发生变化,用的别人接口
  void getContent() {
    NetUtil.get("https://www.apiopen.top/journalismApi", (data) {
      Entity user = Entity.fromJson(data);
      setState(() {
        pageData = user.data;

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
          Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => DetailScreen(todo: todos[i]),
                  builder: (context) =>

                  DetailScreen(title: pageData.auto[0]),

                //    NativeWebView(webUrl:"https://www.baidu.com/",
                //   webRect:Rect.fromLTWH(0.0, 0.0, MediaQuery.of(context).size.width,
                // MediaQuery.of(context).size.height - AppBar().preferredSize.height
                //     -MediaQuery.of(context).padding.top)),

                ),
              );
      },
    );
  }



Widget _appBarView() {
    return AppBar(
      title: Text("每日新闻",
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
            borderSide: BorderSide(width: 5.0, color: Colors.white)),
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
          // color: _getColor(),
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

}



class TodosScreen extends StatelessWidget {
  // final List<Todo> todos;
  final List<Widget> widgets;
  final List<Auto> titles;

  TodosScreen({Key key, @required this.titles,@required this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Todos'),
      // ),
      body:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(title:Text("新闻消息",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,)),
            Expanded(
              child: ListView.separated(
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int position) {
                  return widgets[position];
                },
                //分割器构造器
                separatorBuilder: (BuildContext context, int index) {
                  return index%2==0?divider1:divider2;
                },
              ),
            )
          ],
        )
    );
  }
}





class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  // final Todo todo;
  final Auto title;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(title.title == null ? "":title.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(title.link == null ? "":title.link),
      ),
    );
  }
}


