import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/redux/first_page.dart';
import 'package:flutter_apistudy/back/redux/count_state.dart';
import 'package:flutter_apistudy/back/redux/middleware.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'action_reducer.dart';

void main() {
  /// 第五步创建Store
  final store = Store<CountState>(reducers,
      initialState: CountState.initState(), middleware: initMiddleWare());
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CountState> store;

  MyApp(this.store) : super();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FirstPage('Redux测试第一页'),
      ),
    );
  }
}
