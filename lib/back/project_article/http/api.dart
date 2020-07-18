import 'package:dio/dio.dart';
import 'package:flutter_apistudy/back/project_article/http/http_manager.dart';


//typedef void OnResult(Map<String, dynamic> data);

class Api {
  static const String baseUrl = "https://www.wanandroid.com/";

  //首页文章列表 http://www.wanandroid.com/article/list/0/json
  static const String ARTICLE_LIST = "article/list/";

  static const String BANNER = "banner/json";
  //登录
  //https://www.wanandroid.com/user/login----post
  static const String LOGIN = "user/login";
  //注册
  //https://www.wanandroid.com/user/register----post
  static const String REGISTER = "user/register";

  //退出
  static const String LOGOUT = "user/logout/json";

  //收藏
  static const String COLLECT = "lg/collect/list/";

  static getArticleList(int page) async {
    return HttpManager.getInstance().request('$ARTICLE_LIST$page/json');
  }

  static getBanner() async {
    return await HttpManager.getInstance().request(BANNER);
  }

  static login(String username, String password) async {
    var formData = FormData.fromMap({
      "username": username,
      "password": password,
    });
    return await HttpManager.getInstance()
        .request(LOGIN, data: formData, method: "post");
  }

  static register(String username, String password) async {
    ///必须使用form表单提交
    var formData = FormData.fromMap(
        {"username": username, "password": password, "repassword": password});
    return await HttpManager.getInstance()
        .request(REGISTER, data: formData, method: "post");
  }

  static getCollects(int page) async {
    return await HttpManager.getInstance().request("$COLLECT/$page/json");
  }

  static clearCookie() {
    HttpManager.getInstance().clearCookies();
  }
}
