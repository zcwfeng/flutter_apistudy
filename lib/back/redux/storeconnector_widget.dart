import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/redux/action_reducer.dart';
import 'package:flutter_apistudy/back/redux/count_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class StoreConnectorTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CountState, int>(
        builder: (context, count) {
          return Text("count:$count");
        },
        converter: (store) => store.state.count);
  }
}

class ThunkAddButtonWidget extends StatelessWidget {
  String text;
  int value;

  ThunkAddButtonWidget(this.text, this.value) : super();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CountState, VoidCallback>(
        converter: (Store<CountState> store) {
      return () => store.dispatch(asyncIncrement(value));
    }, builder: (context, callback) {
      return RaisedButton(onPressed: callback, child: Text(text));
    });
  }
}

class StoreConnectorAddButtonWidget extends StatelessWidget {
  String text;
  int value;

  StoreConnectorAddButtonWidget(this.text, this.value) : super();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CountState, VoidCallback>(
        converter: (Store<CountState> store) {
      return () => store.dispatch(IncreAction(value));
    }, builder: (context, callback) {
      return RaisedButton(onPressed: callback, child: Text(text));
    });
  }
}

class StoreConnectorDecreButtonWidget extends StatelessWidget {
  String text;
  int value;

  StoreConnectorDecreButtonWidget(this.text, this.value) : super();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CountState, VoidCallback>(
        builder: (context, callback) {
      return RaisedButton(onPressed: callback, child: Text(text));
    }, converter: (Store<CountState> store) {
      return () => store.dispatch(DecreAction(value));
    });
  }
}
