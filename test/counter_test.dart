// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_apistudy/counter.dart';
void main() {
   group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });

   var array = [23,45,678,9,32,2];
   for(int j=0;j<array.length;++j) {
     for(int i=j+1;i<array.length;++i) {
       if(array[i] > array[j]) {
         var temp = array[i];
         array[i] = array[j];
         array[j] = temp;
       }
     }
   }

   for(var i in array) {
     print(i);
   }
}