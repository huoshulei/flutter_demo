import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qyt/utils/flutter_screenutil.dart';


import 'package:flutter_qyt/ui/mine/mine_page.dart';
import 'package:flutter_qyt/ui/stud/stud_page.dart';
import 'package:flutter_qyt/ui/home/HomePage.dart';
import 'package:flutter_qyt/ui/comm/comm_page.dart';
import 'package:flutter_qyt/values/values.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _tabIndex = 0;
  var _tabIcon = [
    Icon(Icons.home),
    Icon(Icons.edit),
    Icon(Icons.book),
    Icon(Icons.person)
  ];
  var _tabTitle = ['首页', '教材答案', '知识清单', '个人中心'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomePage(),
          StudPage(),
          CommPage(),
          MinePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _tabIcon[0], title: _getTabTitle(0)),
          BottomNavigationBarItem(icon: _tabIcon[1], title: _getTabTitle(1)),
          BottomNavigationBarItem(icon: _tabIcon[2], title: _getTabTitle(2)),
          BottomNavigationBarItem(icon: _tabIcon[3], title: _getTabTitle(3)),
        ],
        backgroundColor: color_fff7f7f7,
        activeColor: Colors.blue,
        iconSize: s48,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        currentIndex: _tabIndex,
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: _tabIcon[0], title: _getTabTitle(0)),
//          BottomNavigationBarItem(icon: _tabIcon[1], title: _getTabTitle(1)),
//          BottomNavigationBarItem(icon: _tabIcon[2], title: _getTabTitle(2)),
//          BottomNavigationBarItem(icon: _tabIcon[3], title: _getTabTitle(3)),
//        ],
//        type: BottomNavigationBarType.fixed,
//        currentIndex: _tabIndex,
//        onTap: (index) {
//          setState(() {
//            _tabIndex = index;
//          });
//        },
//      ),
    );
  }

  Text _getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return Text(
        _tabTitle[curIndex],
        style: style_blue_24,
      );
    } else {
      return Text(
        _tabTitle[curIndex],
        style: style_888888_24,
      );
    }
  }
}
