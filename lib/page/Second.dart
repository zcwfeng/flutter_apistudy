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

  TabController _tabController;

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);

    getContent();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {

          List widgets = <Widget>[];
          for (int i = 0; i < 8; i++) {
            widgets.add(getRow(i,context));
          }
          return TabView(data: pageData,widgets: widgets,);
        }).toList(),
      ),
    );
  }


  Tab getCustomTab(String title){
    return Tab(
      text: title,
    );
  }
  //获取网络数据,这个接口可能会过一段时间就发生变化,用的别人接口
  void getContent() {
    NetUtil.get("https://www.apiopen.top/journalismApi", (data) {
      Entity user = Entity.fromJson(data);
      setState(() {
        pageData = user.data;
        // 留下一个bug暂时,想遍历Data 子对象动态赋值
        // Data data = user.data;
        // for (int i = 0; i < user.data.; i++) {
        //   // myTabs.add(getCustomTab(title.));
        // }

        for(int i=0;i< 8;i++) {
          myTabs.add(getCustomTab(i.toString()));
        }
        // _tabController = TabController(vsync: this, length: myTabs.length);


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


}



class TabView extends StatelessWidget{
  List<Auto> title = [];//TODO: 动态更换
  List widgets = <Widget>[];
  Data data;
  TabView({Key key,this.data,this.widgets});



    @override
  Widget build(BuildContext context) {
    title = data.auto;
    print("build>>>>>>>>>>>>>>>>>>>>>>>" + title.length.toString() + "......" + widgets.length.toString());


    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: TodosScreen(
        titles: title,
        widgets: widgets,
      ),
    );
  }



}



class TodosScreen extends StatelessWidget {
  // final List<Todo> todos;
  final List<Widget> widgets;
  List<Auto> titles;

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
        title: Text(title.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(title.link),
      ),
    );
  }
}


