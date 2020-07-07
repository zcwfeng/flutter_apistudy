import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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

  HttpManager._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000
    );
    _dio = Dio(options);
  }

  request(url,{String method = 'get'}) async{
    try {
      Options option = Options(method: method);
      Response response = await _dio.request(url,options: option);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}