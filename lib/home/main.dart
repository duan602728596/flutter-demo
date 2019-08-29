import 'package:flutter/material.dart';
import './homeBody.dart';
import '../list/main.dart';
import '../my/main.dart';

class HomeState extends State<HomePage> {
  int tabCurrentIndex = 0;

  // 切换选项卡
  void handleRouterTap(int index) {
    if (tabCurrentIndex != index) {
      setState(() {
        tabCurrentIndex = index;
      });
    }
  }

  // 选项卡切换
  Widget tabBodyRender() {
    switch(tabCurrentIndex) {
      case 0:
        return HomeBody();

      case 1:
        return ArticleList();

      case 2:
        return My();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 顶部标题
      appBar: AppBar(title: Text('Flutter Demo')),

      // 导航
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('List'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('My'),
          ),
        ],
        currentIndex: tabCurrentIndex,
        onTap: handleRouterTap,
      ),

      // 布局
      body: tabBodyRender(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}