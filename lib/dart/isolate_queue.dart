import 'dart:isolate';
// 微任务高于普通Event,因为dart是单线程模式
void main() {
  var receiver = ReceivePort();
  receiver.listen((message) {
    print(message);
    Future.microtask(() => print("微服务队列4--插队"));

  });

  Future.microtask(() => print("微服务队列1"));
  receiver.sendPort.send("发送消息给Event-loop接收器1");
  Future.microtask(() => print("微服务队列2"));
  receiver.sendPort.send("发送消息给Event-loop接收器2");
  Future.microtask(() => print("微服务队列3"));
  receiver.sendPort.send("发送消息给Event-loop接收器3");
}
