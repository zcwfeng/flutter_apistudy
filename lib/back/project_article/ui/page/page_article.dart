import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apistudy/back/project_article/common/http/api.dart';
import 'package:flutter_apistudy/back/project_article/ui/page/page_webview.dart';
import 'package:flutter_apistudy/back/project_article/ui/widget/article_item.dart';

/// banner json: https://www.wanandroid.com/banner/json
class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  /// loading 显示控制
  bool _isLoading = true;

  /// 分页，当前页码
  int curPage = 0;

  /// 滑动控制器
  ScrollController _controller = ScrollController();

  /// 存储请求到的文章数
  List articles = [];

  /// 存储banner
  List banners = [];

  /// 文章总数
  int listTotalSize = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //获得 SrollController 监听控件可以滚动的最大范围
      var maxScroll = _controller.position.maxScrollExtent;

      ///获得当前位置的像素值
      var pixels = _controller.position.pixels;

      ///当前滑动位置到达底部，同时还有更多数据
      if (maxScroll == pixels && curPage < listTotalSize) {
        ///加载更多
        _getArticleList();
      }
    });
    _pullToRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // loading
        Offstage(
          offstage: !_isLoading,
          child: Center(child: CircularProgressIndicator()),
        ),
        Offstage(
            offstage: _isLoading,
            child: RefreshIndicator(//下拉刷新

                child: ListView.builder(
                    itemCount: articles.length + 1,//列表视图的个数
                    itemBuilder:(context,i) => _buildItem(i),//类似adapter，item显示什么？返回widget
                    controller: _controller,//滑动控制器

                ),

                onRefresh: _pullToRefresh
            )
        )
      ],
    );
  }

  // 请求刷新
  Future<void> _pullToRefresh() async {
    curPage = 0;
    Iterable<Future> futures = [_getBanners(),_getArticleList()];
    await Future.wait(futures);
    _isLoading = false;
    setState(() {});
    return null;
  }

  _getArticleList([bool update = true]) async {
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      listTotalSize = map['pageCount'];

      if (curPage == 0) {
        articles.clear();
      }
      curPage++;

      articles.addAll(datas);

      // refresh ui
      if (update) {
        setState(() {});
      }
    }
  }

  _getBanners([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);

      if (update) {
        setState(() {});
      }
    }
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      return new Container(
//        height: 180.0,
        height: MediaQuery.of(context).size.height*0.3,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return new ArticleItem(itemData);
  }

  ///banners是请求到的banner信息组，其中imagePath代表了图片地址
  ///map意为映射，对banners中的数据进行遍历并返回Iterable<?>迭代器，
  ///？则是在map的参数：一个匿名方法中返回的类型
  Widget _bannerView(){
    //map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    //map方法最终会返回一个  Iterable<T>
    List<Widget> list = banners.map((item){

        return InkWell(
          child: Image.network(item['imagePath'],fit:BoxFit.cover),
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                return WebViewPage(item);
            }));
          },
        );

    }).toList();
    return list.isNotEmpty? BannerView(
        list,
        intervalDuration:Duration(seconds:2)
    ):null;
  }
}
