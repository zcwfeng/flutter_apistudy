import 'package:flutter/material.dart';

class Fraction{
  num _a;
  num _b;


  Fraction(this._a, this._b);

  Fraction operator + (Fraction other) {
    return Fraction(_a * other._b + other._a * _b,_b * other._b);
  }

  Fraction operator * (Fraction other) {
    return Fraction(_a * other._a,_b * other._b);
  }


  @override
  String toString() {
    if(_a == 0) {
      return '0';
    }else if(_a == _b) {
      return '1';
    } else if(_a.abs() == _b.abs()){
      return '-1';
    }else {
      num temp;
      num x = _a;
      num y = _b;
      if(x < y) {
        temp = x;
        x = y;
        y = temp;
      }
      temp = _gcd(x, y);
      return "${_a/temp} / ${_b/temp}";
    }
  }

  //辗转相除法(欧几里德算法) gcd(a,b) = gcd(b,a mod b)
  num _gcd(num x, num y) {
    num r = x % y;
    return r == 0 ? y : _gcd(y, r);
  }
}
void main(){

  var fra = Fraction(6, 9) * Fraction(3, 4);
  print(fra.toString());
}