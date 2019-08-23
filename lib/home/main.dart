import 'package:flutter/material.dart';
import './homeList.dart';

class HomeState extends State<HomeLayout> {
  int tabCurrentIndex = 0;

  // 切换选项卡
  void handleRouterTap(int index) {
    if (tabCurrentIndex != index) {
      setState(() {
        tabCurrentIndex = index;
      });
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
            title: Text('Me'),
          ),
        ],
        currentIndex: tabCurrentIndex,
        onTap: handleRouterTap,
      ),

      // 布局
      body: Container(
        color: Color(0xffffffff),
        child: Column(children: <Widget>[
          // 图片banner
          Row(children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset('assets/images/banner.jpg'),
            )
          ]),

          // 列表
          Padding(
            padding: EdgeInsets.only(top: 8, right: 8, bottom: 32, left: 8),
            child: Container(child: HomeList()),
          ),
        ]),
      ),
    );
  }
}

class HomeLayout extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeLayout();
  }
}