import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'api.dart';

class HttpManager{
  Dio _dio;
  static HttpManager _instance;

  factory HttpManager.getInstance(){
    if(null == _instance){
      _instance = HttpManager._internal();
    }
    return _instance;
  }

  PersistCookieJar _persistCookieJar;

  HttpManager._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000
    );
    _dio = Dio(options);
    _initDio();
  }

  void clearCookies(){
    _persistCookieJar.deleteAll();
  }

  request(url,{data,String method = "get"}) async{
    try {
      Options option = Options(method: method);
      Response response = await _dio.request(url,data:data,options: option);
      return response.data;
    } catch (e) {
      debugPrint("请求异常---->$url");
      print(e);
      return null;
    }
  }

  void _initDio() async{
    Directory directory = await getApplicationDocumentsDirectory();
    var path = Directory(join(directory.path, "cookie")).path;
    _persistCookieJar = PersistCookieJar(dir: path);
    _dio.interceptors.add(CookieManager(_persistCookieJar));
  }


}