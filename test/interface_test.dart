abstract class Parent{
  String name;
  void printName();
  void printName2(){

  }
}


class IA{
  void a(){}
}

class A implements IA{
  @override
  void a() {
    // TODO: implement a
  }

}

class B extends IA{

}

class Test{
//  void call(){
//    print("like groovy");
//  }
  void call2(){
    print("like groovy call2");

  }
  void call(int i){
    print("like groovy i");

  }
}

void main(){
  print("interface test like groovy");
  Test test = Test();
  test(1);
}