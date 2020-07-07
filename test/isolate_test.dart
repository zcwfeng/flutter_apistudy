import 'dart:io';
import 'dart:isolate';

int i;

void entryPoint(SendPort sendPort) {
  sendPort.send("111");
}

void main() {
  var receiver = ReceivePort();
  Isolate.spawn(entryPoint, receiver.sendPort);

  receiver.listen((t) {
    print(t);
  });

}
