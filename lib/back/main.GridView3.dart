import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HomeScreen(),
  ));
}
//1
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> datas = getDataList();
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body:
        GridView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return getItemContainer(datas[index]);
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //单个子Widget的水平最大宽度
                maxCrossAxisExtent: 50,
                //水平单个子Widget之间间距
                mainAxisSpacing: 20.0,
                //垂直单个子Widget之间间距
                crossAxisSpacing: 10.0
              ),
            )

    );
  }
}