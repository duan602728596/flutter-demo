import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        // 头像图片
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/avatar.jpg',
              width: 72,
              height: 72,
            ),
          ),
        ),

        // 昵称
        Text(
          'Nickname',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),

      // 分割线
      Divider(color: Color(0xffd9d9d9)),
    ]);
  }
}