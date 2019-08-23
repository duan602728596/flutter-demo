import 'package:flutter/material.dart';

/* 通用方法 */

// 路由跳转
void routerPush(BuildContext context, module) {
  Navigator.of(context).pushAndRemoveUntil(
    new MaterialPageRoute(builder: (context) => module()),
    (route) => route == null,
  );
}