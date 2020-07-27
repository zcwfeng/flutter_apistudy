import 'package:flutter/material.dart';

void main() => runApp(TestFutureBuilder());

class TestFutureBuilder extends StatefulWidget {
  @override
  _TestFutureBuilderState createState() => _TestFutureBuilderState();
}

class _TestFutureBuilderState extends State<TestFutureBuilder> {

  @override
  void initState() {
    super.initState();
  }

  Future<String> test() async{
    await Future.delayed(Duration(seconds: 10));
    return "哈哈哈";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("123"),
        ),
        body: FutureBuilder<String>(
          future: test(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data);
            }else {
              return Text("未完成");
            }
          },
        ),
      ),
    );
  }
}