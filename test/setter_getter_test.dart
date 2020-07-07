import 'exception_test.dart';

    class Point{
      int _x;
      int _y;

      int get x => _x;

      set x(int value) => _x = value;

      int get y => _y;

      set y(int value) => _y = value;


      Point operator + (Point other){
        var point = Point();
        point._x = _x + other._x;
        return point;
      }

      String operator >= (int x) {
        return "骚操作";
      }

    }

    void main(){
      var point = Point();
      point.x = 1;
      print(point.x);
      print(point.y);
      var point2 = Point();
      point2.x = 10;

      point2 = point2 + point;
      print(point2.x);

      String teststr = point2 >= 1;
      print(teststr);
    }