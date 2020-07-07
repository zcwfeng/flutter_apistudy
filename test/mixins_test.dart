// a with b,c  自身没有从右向左顺序调用  a c b
class A{
  void a(){

  }
  void call(){
    print('a');
  }
  void all(){
    print('all a');
  }
}

class C with A,B{
  void c(){

  }

  void call(){
    print('c');
    super.call();
  }
}

class B{
  void b(){

  }
  void call(){
    print('b');
  }

  void all(){
    print('all b');
  }
}

class myC = Object with A,B;

void main(){
  var c = C();
  c.a();
  c.b();
  c.c();
  c();

  c.all();

}