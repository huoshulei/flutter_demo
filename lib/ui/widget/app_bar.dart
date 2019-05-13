import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyt/values/values.dart';


///appBar
CupertinoNavigationBar buildCupertinoNavigationBar(String title,
    {BuildContext context, String tag, String previousPageTitle}) {
  return CupertinoNavigationBar(
    padding: EdgeInsetsDirectional.only( end: m30),
    leading: context == null
        ? null
        : IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back_ios, color: color_dd888888, size: m50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
    previousPageTitle: previousPageTitle,
    middle: Text(
      title,
      style: style_222831_36_b,
    ),
////        elevation: 5,

    backgroundColor: color_fff7f7f7,
    actionsForegroundColor: color_dd888888,
    transitionBetweenRoutes: false,
    heroTag: tag ?? title,
  );
}

CupertinoNavigationBar buildCupertinoNavigationBarNor(String title,
    {BuildContext context,
    String tag,
    String previousPageTitle,
    Color backgroundColor}) {
  return CupertinoNavigationBar(
    padding: EdgeInsetsDirectional.only( end: m30),
    leading: context == null
        ? null
        : IconButton(
            alignment: Alignment.centerLeft,
            icon: Icon(Icons.arrow_back_ios, color: color_dd888888, size: m50),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
    previousPageTitle: previousPageTitle,
    middle: Text(
      title,
      style: style_222831_36_b,
    ),
////        elevation: 5,

    backgroundColor: backgroundColor ?? color_fff7f7f7,
    actionsForegroundColor: color_dd888888,
    transitionBetweenRoutes: false,
    heroTag: tag ?? title,
    border: Border(),
  );
}
