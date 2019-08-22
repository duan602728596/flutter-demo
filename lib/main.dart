import 'package:flutter/material.dart';
import './login/main.dart';
import './home/main.dart';

/* App main */
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      home: Scaffold(
        body: Login(),
      ),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}