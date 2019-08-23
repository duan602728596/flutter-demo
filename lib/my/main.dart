import 'package:flutter/material.dart';
import './avatar.dart';
import './menuItem.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 头像
      Padding(child: Avatar(), padding: EdgeInsets.only(top: 8, bottom: 8)),

      // 列表
      MenuItem(text: 'Menu 0'),
      MenuItem(text: 'Menu 1'),
      MenuItem(text: 'Menu 2'),
    ]);
  }
}