import 'dart:io';
import 'dart:isolate';

int i;

void entryPoint(SendPort sendPort) {
  sendPort.send("111");
  print(i);
  var receiver = new ReceivePort();
  var sendPort2 = receiver.sendPort;
  sendPort.send(sendPort2);

  receiver.listen((message) {
    print(message);
    if(message is SendPort) {
      print('接受到主线程Sendport');
    }
  });

}

void entryPoint2(String message){
  print('entryPoint2:$message');
}

void main() {
  i = 10;
  var receiver = ReceivePort();
  Isolate.spawn(entryPoint, receiver.sendPort);
  // 接受子线程发来的sendport
  receiver.listen((t) {
    print(t);
    if(t is SendPort) {
      print('接受到子线程sendport');
      print(i);
    }
  });


// receiver

//  var receiver = ReceivePort();
//
//  receiver.listen((message) {
//    print(message);
//  });
//  receiver.sendPort.send("1");
//  receiver.sendPort.send("2");
//  receiver.close();

// swan
//Isolate.spawn(entryPoint2, "hello");


}
