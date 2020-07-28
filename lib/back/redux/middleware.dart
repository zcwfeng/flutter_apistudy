import 'package:flutter_apistudy/back/redux/action_reducer.dart';
import 'package:flutter_apistudy/back/redux/count_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

List<Middleware<CountState>> initMiddleWare() {
  List<Middleware<CountState>> middlewares = [];
  List<MiddleWareFactory> factories = [LogMiddle(), ThunMiddle()];

  factories.forEach((factory) {
    middlewares.addAll(factory.generate());
  });

  return middlewares;
}

abstract class MiddleWareFactory {
  MiddleWareFactory();

  List<Middleware<CountState>> generate();
}

class ThunMiddle extends MiddleWareFactory {
  @override
  List<Middleware<CountState>> generate() {
    return [
      TypedMiddleware<CountState, ThunkAction>(_doTrunkAction),
    ];
  }

  void _doTrunkAction(
      Store<CountState> store, ThunkAction action, NextDispatcher next) {
    if (action is ThunkAction) {
      action(store);
    } else {
      next(action);
    }
  }
}

class LogMiddle extends MiddleWareFactory {
  @override
  List<Middleware<CountState>> generate() {
    return [
      TypedMiddleware<CountState, IncreAction>(_doIncreAction),
      TypedMiddleware<CountState, DecreAction>(_doDecreAction),
    ];
  }

  void _doIncreAction(
      Store<CountState> store, IncreAction action, NextDispatcher next) {
    next(action);
    print(
        "store:${store.state.count},action type:${action.type},value ${action.value}");
  }

  void _doDecreAction(
      Store<CountState> store, DecreAction action, NextDispatcher next) {
    next(action);
    print(
        "store:${store.state.count},action type:${action.type},value ${action.value}");
  }
}
