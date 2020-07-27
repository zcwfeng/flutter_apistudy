import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: BottomNavigationWidget(),
  ));
}

//1
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Row(
        children: <Widget>[
          Center(
          child: Text("page1"),
          ),
          Center(
            child: SelectionButton(),
          ),
        ],
      ),
    );
  }
}


//1
class AlarmsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmsScreenState();
}

class AlarmsScreenState extends State<AlarmsScreen> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('AlarmsScreen'),
    //   ),
    // );


    return Scaffold(
      appBar: AppBar(
        title: Text('AlarmsScreen'),
      ),
      body: MaterialApp(
        title: 'AlarmsScreen',
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.

        // 使用“/”命名路由来启动应用（Start the app with the "/" named route. In our case, the app will start）
        // 在这里，应用将从 FirstScreen Widget 启动（on the FirstScreen Widget）
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          // 当我们跳转到“/”时，构建 FirstScreen Widget（When we navigate to the "/" route, build the FirstScreen Widget）

          '/': (context) => FirstScreen(),

          // When navigating to the "/second" route, build the SecondScreen widget.
          // 当我们跳转到“/second”时，构建 SecondScreen Widget（When we navigate to the "/second" route, build the SecondScreen Widget）
          '/second': (context) => SecondScreen(),
        },

      ),
    );
  }
}


//1
class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileScreen'),
      ),
    );
  }
}


//1
class EmailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmailScreen'),
      ),
      body: TodosScreen(
        todos: List.generate(20, (i) => Todo(
          'Todo $i',
          'A description of what needs to be done for Todo $i'),
          ),
      ),
    );
  }
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
    return Scaffold(
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
    );
  }
}


// 测试跳转到第二个页面
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Yep" (Pop here with "Yep"...)
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Nope" (Pop here with "Nope")
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
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

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Todos'),
      // ),

      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
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

///
///导航到对应名称的路由
///

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen when tapped.
            // 点击时跳转到第二个界面！（Navigate to second screen when tapped!）
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            // 通过从堆栈弹出当前路由（Navigate back to the first screen by popping the current route）
            // 来返回到第一个界面（off the stack）
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}