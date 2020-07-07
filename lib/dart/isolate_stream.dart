import 'dart:io';

void main(){

//  File("/Users/zcw/Downloads/crawler_1.2QVOD.rar")
//      .readAsBytes().then((_) {
////    print(event);
//    print('future');
//  });

  var dst = File("/Users/zcw/Downloads/test.rar");
  var writer = dst.openWrite(mode: FileMode.append);

  //Dart 字节用int表示没有byte,读取大文件
  Stream<List<int>> stream = File("/Users/zcw/Downloads/crawler_1.2QVOD.rar")
      .openRead();
  // ignore: cancel_subscriptions
  var lsn = stream.listen((s) =>  print('stream'));
  lsn.onData((data) {
    print('stream2');
//    writer.add(data);
  });
  // 写文件
  writer.addStream(stream);
  writer.close();
//  lsn.pause();
//  lsn.resume();


}