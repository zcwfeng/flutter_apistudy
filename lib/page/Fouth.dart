import 'package:flutter/material.dart';
import '../model/CustomCalendar.dart' as CustomCalendar;

//1
class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ProfileScreen'),
      // ),
      body: MaterialApp(

        title: 'Navigation with Arguments',
        home: CustomCalendar.DefaultStylePage(title:"日历黄历"),
      ),
    );
  }
}


