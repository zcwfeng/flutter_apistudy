import 'package:event_bus/event_bus.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppManager{
  static const String ACCOUNT = "accoutName";
  static EventBus eventBus = EventBus();
  static SharedPreferences prefs;
  static initApp() async{
    await Api.init();
    prefs = await SharedPreferences.getInstance();
  }

  static isLogin() {
    return  prefs.getString(ACCOUNT) != null;
  }
}