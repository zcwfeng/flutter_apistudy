import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/NetUtil.dart';
import '../data/entity.dart';

void main() => runApp(
    SampleApp()
  );

class SampleApp extends StatelessWidget {
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
  List widgets = [];
  List<Auto> title = [];

  @override
  void initState() {
    super.initState();

    // loadData();
    getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
          itemCount: title.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }));
  }

  Widget getRow(int i) {
    print("get Row");
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${title[i].title.toString()}")
    );
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  //获取网络数据
  void getContent() async{
    NetUtil.get("https://www.apiopen.top/journalismApi", (data) {
      print("title>>>>>>NetUtils");

      Entity user = Entity.fromJson(data);
      setState(() {
        title = user.data.auto;
        print("title>>>>>>" + title.length.toString());
      });
    }, errorCallBack: (errorMsg) {
      print("error:" + errorMsg);
    });
  }

}


