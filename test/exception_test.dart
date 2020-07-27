import 'package:flutter_apistudy/back/main.demo/main.TabBar2.dart';

    void testStr(String str){
      print(str);
    }

    void test(){
      throw Exception("你太帅不给你调用");
    }

    void test2(){
      throw "你太帅不给你调用";
    }

    void test3(){
      throw 111;
    }

    int test4(int i){
      if(i == 0){
        throw "000000";
      } else if(i == 1) {
        throw 1;
      } else if(i == 2){
        throw testStr;
      }

      return i;
    }


void main(){





  print("----------------");

  try {
    test();
  } catch (e,s) {
    print(e);
    print(e.runtimeType);

    print(s);
    print(s.runtimeType);
  }
  print("----------------");

  try {
//    test();
//    test2();
    test3();
  } on Exception catch (e,s) {
    print("Exception......lll");
    print(e);
    print(e.runtimeType);

    print(s);
    print(s.runtimeType);
  } on int catch(e) {
    print("int");
    print(e);
  } on String catch(e){
    print("String");
    print(e);
  }

  print("----------------");

  try {
    int i = test4(3);
    if(i == 3) {
      print('return .......');
    }
  } on Function catch (e,s) {
    e("骚操作");
  } on String catch(e) {
    print(e);
  } on int catch(e){
    print(e);
  } finally{

  }
}