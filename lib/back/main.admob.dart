import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BannerAd mBannerAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-5553031321204081~1655276535")
        .then((_) {
      mBannerAd = BannerAd(
          adUnitId: "ca-app-pub-3940256099942544/6300978111",
          size: (AdSize.banner),
          listener: (event) {
            debugPrint("Test Ad:" + event.toString());
          });
      mBannerAd.load().then((_) {
        mBannerAd.show();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AdMob Plugin demo 应用'),
        ),
        body: const Center(
          child: const Text('admob从此开始'),
        ),
      ),
    );
  }
}
