import 'package:flutter/material.dart';

    class Point {
      int _x;
      int y;

      Point(this._x, this.y);

      // 命名构造方法
      Point.Cool() {
        this.y = y;
        print("Cool");
      }

      Point.X(this._x);

    //初始化列表构造方法
      Point.fromMap(Map map)
          : _x = map["x"],
            y = map["y"];

      Point.fromMap2(Map map) {
        _x = map["x"];
        y = map["y"];
      }
    }

class View {
  // 重定向构造方法
  View(int context, int attr);

  View.a(int context) : this(context, 0);

// Java 写法
//  View(int context){
//    this(context,0);
//  }
}

    class ImmutablePoint {
      final int x;
      final int y;

      const ImmutablePoint(this.x, this.y);
    }

    void main() {
      var a = ImmutablePoint(1, 1);
      var b = ImmutablePoint(1, 1);
      print(a == b);
      print(a.hashCode == b.hashCode);
      var c = const ImmutablePoint(1, 1);
      var d = const ImmutablePoint(1, 1);
      print(c == d);
      print(c.hashCode == d.hashCode);
      var e = const ImmutablePoint(1, 2);
      print(c == e);

    }
