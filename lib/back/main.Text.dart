import 'package:flutter/material.dart';
import 'package:flutter_apistudy/data/Constants.dart';
import '../i10n/localization_intl.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "文本"),
      localizationsDelegates: [
        DemoLocalizationsDelegate(),
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('zh', '')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textToShow = "I Like Flutter";

  void _updateText() {
    DemoLocalizations demoLocalizations = DemoLocalizations.of(context);
    String result = demoLocalizations.title();
    setState(() {
      textToShow = "Flutter is Awesome," + Strings.welcomeMessage + result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(textToShow),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
