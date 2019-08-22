import 'package:flutter/material.dart';
import './form.dart';

/* 登陆 */
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 54.0, bottom: 24.0),
          child: Center(
            child: Text('Flutter Demo', style: TextStyle(fontSize: 24, color: Color(0xff2f54eb))),
          ),
        ),
        LoginForm(),
      ])
    );
  }
}