import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModal listData = NewsListModal([]);

  //int page = 0;
  //获取产品列表并且回调
  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Page view
    return Scaffold(
      //带分隔线的LIST
      body: ListView.separated(
          //排列方向
          scrollDirection: Axis.vertical,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            //新闻列表项数据
            NewsItemModal item = listData.data[index];

            return ListTile(
              title: Text(
                item.title,
              ),
              subtitle: Text(item.content),
              leading: Icon(Icons.fiber_new),
              trailing: Icon(Icons.arrow_forward),
              contentPadding: EdgeInsets.all(10.0),
              enabled: true,
              onTap: () {
                Navigator.push(
                    context,
                    //传进参数 可查看product_detail_page Constructor的修改
                    MaterialPageRoute(
                        builder: (context) => NewsDetailPage(item: item)));
              },
            );
          },
          //分割线构造器
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1.0,
                color: Colors.grey,
              ),
          itemCount: listData.data.length),
    );
  }
}
