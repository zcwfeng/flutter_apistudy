import 'Point.dart';
import 'class_factory_test.dart';

void main(){
  Point p = Point(1,2);
  p.y = 3;
  print(p.y);
  Point p2 = new Point.Cool();

  Manager.getInstance();
//    Manager._newInstance();


}