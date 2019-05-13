import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyt/ui/widget/app_bar.dart';

import 'package:flutter_qyt/ui/widget/grade.dart';
import 'package:flutter_qyt/values/values.dart';


class StudPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudState();
  }
}

class _StudState extends State<StudPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCupertinoNavigationBar(context),
      body: Text('Stud'),
    );
  }

  CupertinoNavigationBar _buildCupertinoNavigationBar(BuildContext context) {
    return CupertinoNavigationBar(
      leading: GradeWidget(),
//      padding: EdgeInsetsDirectional.only(start: 15, end: 15),
      automaticallyImplyMiddle: false,
      middle: Container(
//        width: 150,
        child: Row(
          children: <Widget>[
            Icon(Icons.search, size: 20, color: color_dd888888),
            Container(width: 8, height: 0),
            Text('搜索教材找答案', style: style_888888_28)
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(color: color_dd888888, width: 0.3),
            color: color_fff0f0f0,
            borderRadius: BorderRadius.all(Radius.circular(w20))),
        padding: EdgeInsets.all(w10),
      ),
      trailing: GestureDetector(
          child: Icon(Icons.crop_free, color: color_dd888888, size: s52),
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (BuildContext context) {
              return Scaffold(
                appBar: buildCupertinoNavigationBar('这是个什么',
                    context: context, tag: 'why'),
                body: Text('asdasdasdsadsad'),
                backgroundColor: color_fff7f7f7,
              );
            }));
          }),
      backgroundColor: color_fff7f7f7,
      transitionBetweenRoutes: false,
      heroTag: 'stud',
    );
  }
}
