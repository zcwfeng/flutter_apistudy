import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

main() {
  runApp(CalendarViewApp());
}

class CalendarViewApp extends StatelessWidget {
  void handleNewDate(date) {
    print("handleNewDate $date");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calendar'),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('The Default Calendar:'),
              Calendar(
                onSelectedRangeChange: (range) =>
                    print("Range is ${range.item1}, ${range.item2}"),
                onDateSelected: (date) => handleNewDate(date),
              ),
              Divider(
                height: 50.0,
              ),
              Text('The Expanded Calendar:'),
              Calendar(
                onSelectedRangeChange: (range) =>
                    print("Range is ${range.item1}, ${range.item2}"),
                isExpandable: true,
              ),
              Divider(
                height: 50.0,
              ),
              Text('A Custom Weekly Calendar:'),
              Calendar(
                onSelectedRangeChange: (range) =>
                    print("Range is ${range.item1}, ${range.item2}"),
                isExpandable: true,
                dayBuilder: (BuildContext context, DateTime day) {
                  return InkWell(
                    onTap: () => print("OnTap ${day}"),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38)),
                      child: Text(
                        day.day.toString(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
