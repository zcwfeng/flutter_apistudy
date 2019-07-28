# FlutterApiStudy
Flutter Study

# 结构

master 还未合并处于不太稳定状态

develop 使用的时候切换到develop查看代码，因为还不稳定
clone 然后切换develop

```
git clone https://github.com/zcwfeng/flutter_apistudy.git
git checkout develop
```

项目 lib/main/back 作为模块测试用的可以直接运行

```
flutter run lib/main/back/main.xxxxxx.dart
```

方便起见，没有用单元测试和mock测试


直接运行测试

```
flutter run
```

# 计划任务
写猫舍app

# 骗子手机信息大揭秘
https://www.baifubao.com/callback?cmd=1059&callback=phone&phone=18518915494

根据这个接口,提供骚扰电话等列表扫描,购买商品信息

http://www.bejson.com/knownjson/webInterface/

分析可以利用的,人肉骚扰电话

# Api 查询

https://book.flutterchina.club/chapter5/container.html

# Flutter 自定插件，查看我的另一个github项目

https://github.com/zcwfeng/flutter_tutorial/tree/master/flutter_plugin

# TODO List:

1. 垃圾分类详情页
2. 新闻请求和详情页
3. 天气预报查看优化内存，添加新的功能，星座
4. 日历完善，选中日期显示结合星座尝试，或者暂时随机给一句鼓励的话。
5. 整理目录，模块和功能划分，data widget model page utils
6. 整体优化，上线android，ios 待办
7. 日历控件修改适配，功能完善
8. 优化和完善新闻逻辑功能
9. 修改项目目录结构，使得分层更明确
10. 优化效率和内存

# 原创项目，请勿商用，另外请尊重原著。如有api使用有商业疑问请联系我。

# 项目用到的flutter 插件列表，基本通过测试的插件

依赖配置
```
dependencies:
  http: ^0.12.0+1
  flutter:
    sdk: flutter
  sqflite: ^1.1.0
  path: 1.6.2
  transparent_image: ^1.0.0
  cached_network_image: ^0.8.0
  flutter_redux: ^0.5.3
  flutter_calendar: ^0.0.1
  # flutter_inappbrowser: ^1.1.0 不兼容
  dio: ^1.0.0 #网络请求
  json_serializable: ^2.0.0
  build_runner: ^1.0.0
  flutter_custom_calendar:
    git:
      url: https://github.com/LXD312569496/flutter_custom_calendar.git


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2
  flutter_staggered_grid_view: "^0.2.7"
  image_picker: ^0.4.10
  shared_preferences: ^0.4.3
  # json_annotation: ^1.0.0
  video_player: ^0.10.1+5
dev_dependencies:
  flutter_test:
    sdk: flutter
  test: ^1.5.0
  mockito: ^4.1.0
  muses_weather_flutter:
    git:
      url: https://github.com/KinsomyJS/muses_weather_flutter.git
```

# 我的flutter版本

```
Flutter 1.7.8+hotfix.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b712a172f9 (3 weeks ago) • 2019-07-09 13:14:38 -0700
Engine • revision 54ad777fd2
Tools • Dart 2.4.0
```
如果配置和版本我有更新我会随时更新，写日志


# 日志

2019年7月28日 初步测试开发版本0.0.1
