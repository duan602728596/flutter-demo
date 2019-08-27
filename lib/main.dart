import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './store/store.dart';
import './login/main.dart';
import './home/main.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => Login(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}

/* App main */
void main() {
  runApp(StoreProvider(
    store: store,
    child: App(),
  ));
}