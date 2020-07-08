import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  final data;

  WebViewPage(this.data);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoad = true;
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      } else if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoad = false;
        });
      }
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.data['title']),
        bottom: PreferredSize(
          child: const LinearProgressIndicator(),
          preferredSize: const Size.fromHeight(1.0),
        ),
        bottomOpacity: isLoad ? 1.0 : 0.0,
      ),
      url: widget.data['url'],
      withLocalStorage: true, //缓存
      withJavascript: true,
    );
  }
}
