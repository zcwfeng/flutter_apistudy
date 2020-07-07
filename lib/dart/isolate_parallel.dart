import 'dart:isolate';

main(){
  Isolate.spawn(i1,"");
  Isolate.spawn(i2,"");
  while(true){}
}

void i1(msg){
  print('isolate 执行1');
  Future.doWhile(() {
    print('isolate future1');
    return true;
  });
}

void i2(msg){
  print('isolate 执行2');
  Future.doWhile(() {
    print('isolate future2');
    return true;
  });
}