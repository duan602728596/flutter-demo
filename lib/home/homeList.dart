import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../_url.dart';

class ListState extends State<HomeList> {
  List<dynamic> homeData = [];

  // 点击链接
  void handleLinkPress(int i) {
    (i);
  }

  // 请求数据
  Future getHomeListData() async {
    Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      method: 'GET',
      connectTimeout: 10000,
    ));

    var res = await dio.request('/homeData');
    var data = res.data;

    setState(() {
      homeData = data['data'];
    });
  }

  // 初始化
  @override
  void initState() {
    getHomeListData();
  }

  // 渲染列表
  List<Widget> dataListRender() {
    List<Widget> element = [];

    for (int i = 0; i < homeData.length; i++) {
      dynamic item = homeData[i];

      element.add(Container(
        height: 32,
        child: FlatButton(
          child: Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.star, size: 16.0, color: Color(0xfffaad14))
            ),
            Text(item['title'], style: TextStyle(fontSize: 16)),
          ]),
          onPressed: () => handleLinkPress(i),
        ),
      ));
    }

    return element;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: dataListRender());
  }
}

class HomeList extends StatefulWidget {
  @override
  ListState createState() => ListState();
}