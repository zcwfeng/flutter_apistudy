import 'package:flutter/material.dart';
import 'ui/page/page_article.dart';
void main()=> runApp(ArticleApp());

class ArticleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(
              "文章",
          style: const TextStyle(color: Colors.white)),
        ),
        body: ArticlePage(),
      )
    );
  }
}