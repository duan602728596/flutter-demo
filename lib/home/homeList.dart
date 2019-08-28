import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:dio/dio.dart';
import '../store/store.dart';
import './actions.dart';
import '../_url.dart';

class ListState extends State<HomeList> {
  // 初始化
  @override
  void initState() {
    super.initState();
    getHomeListData();
  }

  // 点击链接
  void handleLinkPressed(int i) {
    print(i);
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

    store.dispatch(homeDataAction(data['data']));
  }

  // 渲染列表
  List<Widget> dataListRender(List<dynamic> rawData) {
    List<Widget> element = [];
    List<dynamic> data = rawData ?? [];

    for (int i = 0; i < data.length; i++) {
      dynamic item = data[i];

      element.add(Container(
        height: 32,
        child: FlatButton(
          child: Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.star, size: 16.0, color: Color(0xfffaad14)),
            ),
            Text(item['title'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ]),
          onPressed: () => handleLinkPressed(i),
        ),
      ));
    }

    return element;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store store) {
        return {
          'homeData': store.state['home']['homeData']
        };
      },
      builder: (BuildContext context, Map<String, dynamic>count) {
        return Column(children: dataListRender(count['homeData']));
      },
    );
  }
}

class HomeList extends StatefulWidget {
  @override
  ListState createState() => ListState();
}