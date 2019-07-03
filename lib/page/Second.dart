import 'package:flutter/material.dart';

//1
class EmailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmailScreenState();
}

List todos = List.generate(10, (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i'),
          ).toList();

List widgets = <Widget>[];

class EmailScreenState extends State<EmailScreen> {


  @override
  void initState() {
    super.initState();
    print("initState>>>>>>>>>>>>>>>>>>>>>>>");
    widgets.clear();
    for (int i = 0; i < 10; i++) {
      widgets.add(getRow(i,context));
    }
  }
  @override
  Widget build(BuildContext context) {
    print("build>>>>>>>>>>>>>>>>>>>>>>>" + todos.length.toString() + "......" + widgets.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('EmailScreen'),
      ),
      body: TodosScreen(
        todos: todos,
        widgets: widgets,
      ),
    );
  }

  Widget getRow(int i,BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(todos[i].title,textAlign: TextAlign.center)),
      onTap: () {
        // setState(() {
        //   widgets.add(getRow(widgets.length + 1,context));
        // });

        Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => DetailScreen(todo: todos[i]),
                  builder: (context) =>

                  DetailScreen(todo: todos[i]),

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




// 跳转到第二个页面传递数据
// Data
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;
  final List<Widget> widgets;

  TodosScreen({Key key, @required this.todos,@required this.widgets}) : super(key: key);

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

      // ListView.builder(
      //   itemCount: todos.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(todos[index].title),
      //       // When a user taps the ListTile, navigate to the DetailScreen.
      //       // Notice that you're not only creating a DetailScreen, you're
      //       // also passing the current todo through to it.
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => DetailScreen(todo: todos[index]),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),


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
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}


