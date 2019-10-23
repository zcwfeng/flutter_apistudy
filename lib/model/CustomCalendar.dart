import 'package:flutter/material.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';

class DefaultStylePage extends StatefulWidget {
  DefaultStylePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DefaultStylePageState createState() => _DefaultStylePageState();
}

class _DefaultStylePageState extends State<DefaultStylePage> {
  String text;

  CalendarController controller;

  @override
  void initState() {
    super.initState();
    text = "${DateTime.now().year}年${DateTime.now().month}月";

    controller = new CalendarController();

    controller.addMonthChangeListener(
      (year, month) {
        setState(() {
          text = "$year年$month月";
        });
      },
    );

    controller.addOnCalendarSelectListener((dateModel) {
      //刷新选择的时间
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: Icon(Icons.navigate_before),
                    onPressed: () {
                      controller.moveToPreviousMonth();
                    }),
                new Text(text),
                new IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      controller.moveToNextMonth();
                    }),
              ],
            ),
            CalendarViewWidget(
              calendarController: controller,
            ),
            buildText(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text buildText() {
    var year = "";
    var month = "";
    var day = "";
    if (controller.getSingleSelectCalendar() != null) {
      if (controller.getSingleSelectCalendar().year != null) {
        year = controller.getSingleSelectCalendar().year.toString();
      }

      if (controller.getSingleSelectCalendar().month != null) {
        month = controller.getSingleSelectCalendar().month.toString();
      }

      if (controller.getSingleSelectCalendar().day != null) {
        day = controller.getSingleSelectCalendar().day.toString();
      }
    }
    if (year.isEmpty || month.isEmpty || day.isEmpty) {
      return new Text("选择日期");
    }
    return new Text("选中的时间:${year}年${month}月${day}日");
  }
}
