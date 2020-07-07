import 'dart:async';

class EventBus {
  StreamController _streamController;
  static EventBus _instance;

  factory EventBus.getDefault() {
    return _instance ??= EventBus._internal(); ////kotlin ?:
  }

  EventBus._internal() {
    _streamController = StreamController.broadcast();
  }

  void post(event) {
    _streamController.add(event);
  }

  void destory() {
    _streamController.close();
  }

  StreamSubscription<T> regiest<T>(void onData(T event)) {
    // 没指定类型全局
    if (T == dynamic) {
      return _streamController.stream.listen(onData);
    } else {
      //筛选出类型为T的数据，获得质保函T的stream
      Stream<T> stream =
          _streamController.stream.where((event) => event is T).cast<T>();
      return stream.listen(onData);
    }
  }
}

void main() {
  EventBus.getDefault().regiest((s) {
    print("全类型注册:$s");
  });

  EventBus.getDefault().regiest<String>((s) {
    print("字符串注册:$s");
  });

  EventBus.getDefault().regiest<int>((s) {
    print("int注册:$s");
  });

  EventBus.getDefault().post("哈哈");
  EventBus.getDefault().post(1);

  EventBus.getDefault().post(10086.11);
}
