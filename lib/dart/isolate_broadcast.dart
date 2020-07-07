import 'dart:async';
import 'dart:io';

main(){
  var stream = Stream.fromIterable([1,2,3,4]);

  // 转成广播可以接受多个监听
  var boroadcast = stream.asBroadcastStream();
  boroadcast.listen((i) {
    print('订阅者1：$i');
  });
  boroadcast.listen((i) {
    print('订阅者2：$i');
  });


  //直接create广播
  // ignore: close_sinks
  var broadcastController = StreamController.broadcast();
  broadcastController.add("1");
  broadcastController.stream.listen((event) {
    print('broadcastController:$event');
  });

  boroadcast.listen((event) {
    print('goon 订阅 ：$event');

  });
}