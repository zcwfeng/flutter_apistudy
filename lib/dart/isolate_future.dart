import 'dart:io';

void main() {
  Future.delayed(Duration(seconds: 3)).then((value) => print(value));

  File(
      "/Users/zcw/dev/workspace_flutter/flutter_apistudy/lib/dart/isolate_demo.dart")
      .readAsString()
      .then((value) {
    print(value);
    return 10;
  })
      .then((value) => print(value))
      .catchError((e, s) {
    print(e.toString() + ">>>");
    print(s.toString() + ">>>");
  });
  //then 执行，有序执行，一个任务结束，下一个任务根据上一个任务的结果执行不同的操作，类似RxJava

  Future.wait([
    Future.delayed(Duration(seconds: 1)),
    Future.delayed(Duration(seconds: 1))
  ]).then((_) => print(11111));
  // wait 执行一组任务在执行then 统一处理

  Future.forEach([2, 3, 4, 5], (element) => {
    print(element)
  });


}
