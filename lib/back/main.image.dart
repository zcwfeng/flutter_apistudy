import 'package:flutter/material.dart';
//import 'package:transparent_image/transparent_image.dart';
//import 'package:cached_network_image/cached_network_image.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
        ),
        body: Stack(
          children: <Widget>[
            Center(child: CircularProgressIndicator()),

            // Image.asset('images/cat_template.jpg'),
            // Image.network('https://picsum.photos/250?image=9'),
            // Image.network(
            //   'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true'
            //   ),
            Center(
              // child:
              // FadeInImage.memoryNetwork(
              //   placeholder: kTransparentImage,
              //   image: 'https://picsum.photos/250?image=9',
              // ),

              // child: FadeInImage.assetNetwork(
              //     placeholder: 'images/loading.gif',
              //     image: 'https://picsum.photos/250?image=9',
              //   ),

              child: Image.network(
                'https://picsum.photos/250?image=9',
              ),

              // child: Image.asset('images/cat_template.jpg'),

              // child: FadeInImage.assetNetwork(
              //   placeholder: 'images/loading.gif',
              //   image: 'https://picsum.photos/250?image=9',
              // ),

              // child: CachedNetworkImage(imageUrl: 'https://picsum.photos/250?image=9'),

              // CachedNetworkImage 不兼容，密切关注
//              child: CachedNetworkImage(
//                placeholder: (context, url) => CircularProgressIndicator(),
//                imageUrl: 'https://picsum.photos/250?image=9',
//              ),
            ),
          ],
        ));
  }
}
