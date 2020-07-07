// 一切都是对象
void fun(Function f) {
  f(1);
}

void fun2(Function f) {}

void fun3(void f1(int i, int j)) {}

typedef String F(int i, int j);

String fun4(F f) {
  return f(1, 1);
}

    // 对比java
    class OnCicklistener {
      void onClick() {}
    }

    class Button {
      void setOnClicklistener(OnCicklistener onCicklistener) {}
    }

    // dart
    typedef void onClick();
    class Button2 {
      void setOnClicklistener(onClick listener) {
        listener();
      }
    }

// 可选位置参数
void fun5([int i,int j = 2]){
  print(i);
  print(j);
}

// 可选命名参数
void fun6({int i, int j = 2}) {
  print(i);
  print(j);
}

void main() {
//  Function f = fun;
//  f((int i, int j) {
//    return "1";
//  });

//  fun2((int i, int j) {});
//
//  fun5(3);
//  fun5(3,5);
  fun6(i:3,j:0);
  fun6(j:6,i:300);
//  fun6(j:2,i:19);
}
