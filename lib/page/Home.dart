import 'package:flutter/material.dart';

// import 'package:transparent_image/transparent_image.dart';
//import 'package:cached_network_image/cached_network_image.dart';
//import 'package:path/path.dart' as prefix0;
const wastDetails = [
  "有害垃圾主要是指废旧电池、荧光灯管、水银温度计、废油漆桶、腐蚀性洗涤剂、医院垃圾、过期药品、含辐 射性废弃物等。",
  "湿垃圾就是有机垃圾，指日常生活垃圾中可分解的有机物质部分，包括食物残渣、菜根、菜叶，动物蹄、角、瓜皮、果屑、蛋壳、鱼鳞、蛋壳、毛发、植物枝干、树叶、杂草、动物尸体、牲畜粪便等。",
  "可回收垃圾，大体上分为五大类：废纸、塑料、玻璃、金属和布料。像报纸、杂志、广告单及其他干净的纸类都属于可回收垃圾。要强调的是，纸巾和卫生用纸不在可回收的范围内，因为它们水溶性太强，不可回收。",
  "干垃圾包括废弃的纸张、塑料、玻璃、 金属、织物等，还包括报废车辆、家电家具、装修废弃物等大型的垃圾。"
];

//1
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Image getImage(String item) {
    Image image = Image.asset('images/cat_template.jpg');
    if ("0" == item) {
      image = Image.asset('images/waste_hazardous.png');
    }

    if ("1" == item) {
      image = Image.asset('images/waste_household_food.png');
    }

    if ("2" == item) {
      image = Image.asset('images/waste_recyclable.png');
    }

    if ("3" == item) {
      image = Image.asset('images/waste_residual.png');
    }

    return image;
  }

  String getDesc(String item) {
    String desc = "";
    if ("0" == item) {
      desc = wastDetails[0];
    }

    if ("1" == item) {
      desc = wastDetails[1];
    }

    if ("2" == item) {
      desc = wastDetails[2];
    }

    if ("3" == item) {
      desc = wastDetails[3];
    }

    return desc;
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(),
      child: GestureDetector(
        child: Hero(
          tag: item,
          // child: Image.network(
          //   'https://picsum.photos/250?image=9',
          // ),
          child: getImage(item),
          // child: FadeInImage.memoryNetwork(
          //   placeholder: kTransparentImage,
          //   image: 'https://picsum.photos/250?image=9',
          // ),
          // child: FadeInImage.assetNetwork(
          //   placeholder: 'images/loading.gif',
          //   image: 'https://picsum.photos/250?image=9',
          // ),

          // child: CachedNetworkImage(
          //   placeholder: (context, url) => CircularProgressIndicator(),
          //   imageUrl: 'https://picsum.photos/250?image=9',
          // ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreenImageAnim(
              content: getDesc(item),
            );
          }));
        },
      ),
      color: Colors.white10,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> datas = getDataList();
    return Scaffold(
        appBar: AppBar(
          title: Text('垃圾分类',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        body: GridView.custom(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 10.0,
            ),
            childrenDelegate: SliverChildBuilderDelegate((context, position) {
              return getItemContainer(datas[position]);
            }, childCount: datas.length)));
  }
}

// 测试跳转到第二个页面
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    // final result =
    await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}

///
/// Detail Screen Anim
///

class DetailScreenImageAnim extends StatelessWidget {
  final String content;
  DetailScreenImageAnim({Key key, this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('讲解'),
        //     actions: <Widget>[
        //       IconButton(
        //         icon: Icon(Icons.playlist_play),
        //         tooltip: 'Air it',
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.playlist_add),
        //         tooltip: 'Restitch it',
        //       ),
        //       IconButton(
        //         icon: Icon(Icons.playlist_add_check),
        //         tooltip: 'Repair it',
        //   ),
        // ],
      ),
      body: GestureDetector(
        child: Column(
          children: <Widget>[
            Center(
              child: Hero(
                  tag: 'imageHero',
                  child: Center(
                    child: Text(content, textAlign: TextAlign.start),
                  )),
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Yep" (Pop here with "Yep"...)
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Nope" (Pop here with "Nope")
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
