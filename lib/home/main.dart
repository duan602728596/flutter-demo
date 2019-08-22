import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffffffff),
        child: Column(
          children: <Widget>[
            // 图片banner
            Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Image.asset('assets/images/banner.jpg'),
                ),
              )
            ],),
          ],
        ),
      ),
    );
  }
}