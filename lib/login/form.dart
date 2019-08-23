import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../home/main.dart';
import './baseUrl.dart'; // 自定义baseUrl

class LoginForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username;
  String password;

  // 表单验证的正则
  static RegExp usrValidReg = RegExp(r'^\s*$');
  static RegExp pwdValidReg = RegExp(r'^$');

  // 登陆
  Future login(BuildContext context) async {
    try {
      Dio dio = Dio(BaseOptions(
        baseUrl: baseUrl, // 使用电
        // 脑的ip地址而不是127.0.0.1
        method: 'POST',
        connectTimeout: 60000,
      ));

      var res = await dio.request('/login', data: {
        'username': username,
        'password': password
      });
      var data = res.data;

      if (data['code'] == 0) {
        // 登陆成功
        SnackBar snackBar = SnackBar(
          content: Text('Login success!'),
          duration: Duration(seconds: 2),
        );

        Scaffold.of(context).showSnackBar(snackBar);

        // 路由跳转
        // Navigator.of(context).pushNamed('/home');

        // 路由跳转并删除路由
        Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => Home()),
          (route) => route == null,
        );
      } else {
        // 登陆失败
        SnackBar snackBar = SnackBar(
          content: Text('Login faild!'),
          duration: Duration(seconds: 2),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      }
    } catch (err) {
      print(err);

      SnackBar snackBar = SnackBar(
        content: Text('This has an error!'),
        duration: Duration(seconds: 2),
      );

      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  // 提交表单
  void handleFormSubmit(BuildContext context) {
    var formState = formKey.currentState;

    formState.save();

    if (formState.validate()) {
      login(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(children: <Widget>[
          // 用户名
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 80,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'username'),
                validator: (value) {
                  if (usrValidReg.hasMatch(value)) {
                    return 'Please input username.';
                  }

                  return null;
                },
                onSaved: (value) {
                  username = value;
                },
              ),
            ),
          ),

          // 密码
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Container(
              height: 80,
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'password'),
                validator: (value) {
                  if (pwdValidReg.hasMatch(value)) {
                    return 'Please input password.';
                  }

                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
            ),
          ),

          // 提交
          Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: RaisedButton(
                color: Color(0xff2f54eb),
                child: Text('Submit', style: TextStyle(color: Color(0xffffffff))),
                onPressed: () {
                  handleFormSubmit(context);
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}