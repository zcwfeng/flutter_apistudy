import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/redux/storeconnector_widget.dart';

class SecondPage extends StatelessWidget {
  String title;

  SecondPage(this.title) : super();

  @override
  Widget build(BuildContext context) {
    print("2222222");
    return Material(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),

          /// 第六步，获取store，state
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreConnectorTextWidget(),
          ),
          // 第七部，发送Action
          StoreConnectorAddButtonWidget("加1", 1),
          StoreConnectorAddButtonWidget("加2", 2),
          StoreConnectorDecreButtonWidget("减1", -1),
          StoreConnectorDecreButtonWidget("减2", -2),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("返回第一个页面"),
          )
        ],
      ),
    ));

  }
}
