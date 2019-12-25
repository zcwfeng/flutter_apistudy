import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// 1
//Flutter 可以通过直接和 Android 层通信并请求分享的数据来处理接收到的 Android intent。
//运行 Flutter 代码的原生 Activity 注册了一个文本分享的 intent 过滤器，这样其它应用就可以和 Flutter 应用分享文本了。

//从以上流程可以得知，我们首先在 Android 原生层面（在我们的 Activity 中）处理分享的文本数据，
//然后 Flutter 再通过使用 MethodChannel 获取这个数据。

// 2
//接着在 MainActivity 中处理 intent，提取出其它 intent 分享的文本并保存。
//当 Flutter 准备好处理的时候，它会使用一个平台通道请求数据，数据便会从原生端发送过来
//最后，当 Widget 渲染的时候，从 Flutter 这端请求数据：

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Shared App Handler',
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
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = "No data 我应该做些什么，传给底层呢，这个测试我有点懵";

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(dataShared)));
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    }
  }
}
