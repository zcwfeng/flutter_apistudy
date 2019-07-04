import 'package:flutter/material.dart';
import '../utils/NetUtil.dart';
import '../data/entity.dart';


class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsScreenState();
}




class NewsScreenState extends State<NewsScreen> {

  List<Auto> title = [];
  List widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    getContent();
  }
  @override
  Widget build(BuildContext context) {
    print("build>>>>>>>>>>>>>>>>>>>>>>>" + title.length.toString() + "......" + widgets.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('EmailScreen'),
      ),
      body: TodosScreen(
        titles: title,
        widgets: widgets,
      ),
    );
  }

  Widget getRow(int i,BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(title[i].title,textAlign: TextAlign.center)),
      onTap: () {
        // setState(() {
        //   widgets.add(getRow(widgets.length + 1,context));
        // });

        Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => DetailScreen(todo: todos[i]),
                  builder: (context) =>

                  DetailScreen(title: title[i]),

                //    NativeWebView(webUrl:"https://www.baidu.com/",
                //   webRect:Rect.fromLTWH(0.0, 0.0, MediaQuery.of(context).size.width,
                // MediaQuery.of(context).size.height - AppBar().preferredSize.height
                //     -MediaQuery.of(context).padding.top)),

                ),
              );
      },
    );
  }


  //获取网络数据,这个接口可能会过一段时间就发生变化,用的别人接口
  void getContent() {
    NetUtil.get("https://www.apiopen.top/journalismApi", (data) {
      print("title>>>>>>NetUtils");

      Entity user = Entity.fromJson(data);
      setState(() {
        title = user.data.auto;
        print("title>>>>>>" + title.length.toString());

        widgets.clear();
        for (int i = 0; i < title.length; i++) {
          widgets.add(getRow(i,context));
        }
      });
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
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


