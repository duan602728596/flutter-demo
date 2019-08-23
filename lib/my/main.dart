import 'package:flutter/material.dart';
import './avatar.dart';

class My extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 头像
      Padding(child: Avatar(), padding: EdgeInsets.only(top: 8, bottom: 8)),
    ]);
  }
}