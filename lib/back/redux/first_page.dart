import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/redux/second_page.dart';
import 'package:flutter_apistudy/back/redux/storeconnector_widget.dart';

class FirstPage extends StatelessWidget {
  String title;

  FirstPage(this.title) : super();

  @override
  Widget build(BuildContext context) {
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
          ThunkAddButtonWidget("异步操作加2", 2),

          RaisedButton(
            onPressed: () {
              print("第一页press");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                print("第一页press Navigator");

                return SecondPage("第二页");
              }));
            },
            child: Text("跳转第二个页面"),
          )
        ],
      ),
    ));
  }
}
