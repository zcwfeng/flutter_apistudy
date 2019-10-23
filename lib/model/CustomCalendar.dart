import 'dart:math';

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

  final words = [
    "情生智隔",
    "征服世界，并不伟大，一个人能征服自己，才是世界上最伟大的人",
    "把自己的欲望降到最低点，把自己的理性升华到最高点，就是圣人",
    "嫉妒别人，仇视异己，就等于把生命交给别人",
    "一个人如果不被恶习所染，幸福近矣",
    "诽谤别人，就象含血喷人，先污染了自己的嘴巴",
    "平安是幸，知足是福，清心是禄，寡欲是寿",
    "人之心胸，多欲则窄，寡欲则宽",
    "宁可清贫自乐，不可浊富多忧",
    "受思深处宜先退，得意浓时便可休",
    "势不可使尽，福不可享尽，便宜不可占尽，聪明不可用尽",
    "滴水穿石,不是力量大,而是功夫深",
    "平生不做皱眉事,世上应无切齿人",
    "须交有道之人,莫结无义之友。饮清静之茶，莫贪花色之酒。开方便之门，闲是非之口",
    "多门之室生风，多言之人生祸",
    "世事忙忙如水流，休将名利挂心头。粗茶淡饭随缘过，富贵荣华莫强求",
    "“我欲”是贫穷的标志。事能常足，心常惬，人到无求品自高",
    "人生至恶是善谈人过；人生至愚恶闻己过",
    "诸恶莫做，众善奉行，莫以善小而不为，莫以恶小而为之",
    "莫妒他长，妒长，则己终是短。莫护己短，护短，则己终不长",
    "做事不必与俗同，亦不宜与俗异。做事不必令人喜，亦不可令人憎",
    "世上有两件事不能等：一、孝顺。二、行善",
    "存平等心，行方便事，则天下无事。怀慈悲心，做慈悲事，则心中太平",
    "心量狭小，则多烦恼，心量广大，智慧丰饶",
    "平生无一事可瞒人，此是大快",
    "“恶”，恐人知，便是大恶。“善”，欲人知，不是真善",
    "扶危周急固为美事。能不自夸，则其德厚矣",
    "遇顺境，处之淡然，遇逆境，处之泰然",
    "是非天天有，不听自然无",
    "五官刺激，不是真正的享受。内在安祥，才是下手之处",
    "人为善，福虽未至，祸已远离；人为恶，祸虽未至，福已远离",
    "不妄求，则心安，不妄做，则身安",
    "不自重者，取辱。不自长者，取祸。不自满者，受益。不自足者，博闻",
    "不要在乎别人别人如何看你,要在乎你自己如何看未来,看梦想,看世界"
  ];

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
            Expanded(
                child: Text(
              buildText(),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 16,
              ),
            ))
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

  String buildText() {
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
      return "选择日期";
    }

    String wordRandom = words[Random().nextInt(33)];
    String text = "时间:${year}年${month}月${day}日\n${wordRandom}";
    return text;
  }
}
