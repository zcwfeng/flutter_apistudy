import 'package:dio/dio.dart';

void main() async{
  var dio = Dio();
  var response  = await dio.get("https://www.wanandroid.com/banner/json");

  print(response.data);
}