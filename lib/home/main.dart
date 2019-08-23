import 'package:flutter/material.dart';
import './homeList.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: Container(
        color: Color(0xffffffff),
        child: Column(children: <Widget>[
          // 图片banner
          Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/banner.jpg'),
            )
          ]),

          // 列表
          Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 16,
              right: 16,
              bottom: 32
            ),
            child: Container(child: HomeList()),
          ),
        ]),
      ),
    );
  }
}