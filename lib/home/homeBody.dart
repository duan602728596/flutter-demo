import 'package:flutter/material.dart';
import './homeList.dart';

class HomeBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 图片banner
      Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/banner.jpg'),
        )
      ]),

      // 列表
      Padding(
        padding: EdgeInsets.only(top: 8, right: 8, bottom: 32, left: 8),
        child: Container(child: HomeList()),
      ),
    ]);
  }
}