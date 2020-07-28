import 'package:flutter_apistudy/back/redux/count_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

/// 第三步，创建Action
/// action 是一个对象，必须有一个type属性
enum Actions {
  increment,
  decrement
}

/// action基类
class Action {
  final Actions type;

  Action(this.type);
}

class IncreAction extends Action {

  int value;

  IncreAction(this.value) : super(Actions.increment);

}

///第四步， 创建一个Reducer
CountState increReducer(CountState preState, dynamic action) {
  switch (action.type) {
    case Actions.increment:
      return CountState(preState.count + action.value);
    default:
      return preState;
  }
}

ThunkAction asyncIncrement(int value) {
  return (Store store) async {
    await Future.delayed(Duration(seconds: 3)); //认为模拟异步耗时操作
    store.dispatch(IncreAction(value));
  };
}

class DecreAction extends Action {

  int value;

  DecreAction(this.value) : super(Actions.decrement);

}

/// 创建一个Reducer
CountState decreReducer(CountState preState, dynamic action) {
  switch (action.type) {
    case Actions.decrement:
      return CountState(preState.count + action.value);
    default:
      return preState;
  }
}

///合并 reducer
final reducers = combineReducers([
  increReducer,
  decreReducer
]);