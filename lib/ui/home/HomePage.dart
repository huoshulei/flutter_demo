import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_qyt/ui/widget/grade.dart';
import 'package:flutter_qyt/values/colors.dart';
import 'package:flutter_qyt/values/style.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCupertinoNavigationBar(),
      body: Text('home'),
    );
  }

  CupertinoNavigationBar _buildCupertinoNavigationBar() {
    return CupertinoNavigationBar(
      leading: GradeWidget(),
      padding: EdgeInsetsDirectional.only(start: 15, end: 15),
      middle: Text('首页', style: style_222831_36_b),
      backgroundColor: color_fff7f7f7,
      transitionBetweenRoutes: false,
      heroTag: 'home',
    );
  }
}
