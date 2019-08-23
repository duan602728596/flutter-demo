import 'package:flutter/material.dart';
import './avatar.dart';
import './menuItem.dart';
import '../login/main.dart';

class My extends StatelessWidget {
  // 退出
  void handleLogoutPressed(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => Login()),
      (route) => route == null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // 头像
      Padding(child: Avatar(), padding: EdgeInsets.only(top: 8, bottom: 8)),

      // 列表
      MenuItem(text: 'Menu 0'),
      MenuItem(text: 'Menu 1'),
      MenuItem(text: 'Menu 2'),

      // 退出
      Padding(
        padding: EdgeInsets.only(top: 24, right: 16, left: 16),
        child: Row(children: <Widget>[
          Expanded(
            flex: 1,
            child: RaisedButton(
              color: Color(0xfff5222d),
              child: Text('Logout', style: TextStyle(color: Color(0xffffffff))),
              onPressed: () {
                handleLogoutPressed(context);
              },
            ),
          ),
        ]),
      ),
    ]);
  }
}