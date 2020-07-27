import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text("Sample App"),
        ),
        body:

        // ListView.builder(
        //     itemCount: widgets.length,
        //     itemBuilder: (BuildContext context, int position) {
        //       return getRow(position);
        //     },

        //   )

        Column(
          children: <Widget>[
            ListTile(title:Text("商品列表")),
            Expanded(
              child: ListView.separated(
                itemCount: widgets.length,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
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

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Row $i")),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }
}