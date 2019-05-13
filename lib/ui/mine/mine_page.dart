import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyt/ui/mine/user_page.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_qyt/values/values.dart';


class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<MinePage> {
  var _scrollController = ScrollController();
  var _opacity = 0.0;
  var _name = '登录/注册';
  var _sign = '体验更多服务';
  var _avatar =
      'http://ww1.sinaimg.cn/large/0065oQSqly1frrifts8l5j30j60ojq6u.jpg';

  @override
  void initState() {
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      var d = (offset - 20) / m100;
      _opacity = d > 1.0 ? 1.0 : d < 0.0 ? 0.0 : d;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.all(0),
            controller: _scrollController,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: m358,
                child: Stack(
                  children: <Widget>[
                    _buildHeadWidget(),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildItemWidget(Icons.library_books, '我的课程'),
                    )
                  ],
                ),
              ),
              _buildItemWidget(Icons.comment, '我的消息'),
              _buildItemWidget(Icons.local_florist, '给个好评'),
              _buildItemWidget(Icons.sentiment_dissatisfied, '我要吐槽'),
              _buildItemWidget(Icons.info_outline, '关于我们'),
              _buildItemWidget(Icons.settings, '系统设置'),
            ],
          ),
          Opacity(
            opacity: _opacity,
            child: GestureDetector(
              child: CupertinoNavigationBar(
                padding: EdgeInsetsDirectional.only(start: m30, end: m30),
                middle: Text(
                  '个人中心',
                  style: style_222831_36_b,
                ),
////        elevation: 5,
                backgroundColor: color_fff7f7f7,
                actionsForegroundColor: color_dd888888,
                transitionBetweenRoutes: false,
                heroTag: 'mine',
                border: Border(),
              ),
              onTap: _opacity < 0.1
                  ? () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return UserPage();
                      })).then((value) {
                        setState(() {});
                      });
                    }
                  : null,
            ),
          )
        ],
      ),
    );
  }

  Container _buildItemWidget(IconData icon, String title) => Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: m30, top: m30, right: m30),
        height: m110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(m16),
            color: color_ffffffff,
            boxShadow: [
              BoxShadow(
                  color: color_ffeeeeee,
                  offset: Offset(m2, m6),
                  blurRadius: m12)
            ]),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: m30, top: 0, right: m30),
          leading: Icon(icon, color: color_8c99a9, size: m50),
          dense: true,
          title: Text(
            title,
            style: style_1a293d_30_b,
          ),
          trailing:
              Icon(Icons.arrow_forward_ios, color: color_ffcccccc, size: m30),
          onTap: _onTop(title),
        ),
      );

  SizedBox _buildHeadWidget() => SizedBox(
        width: double.infinity,
        height: m332,
        child: GestureDetector(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg/mine_head.png'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: m44,
                  top: m84,
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/icon/mine_avatar.png',
                      image: _avatar,
                      fit: BoxFit.fill,
                      width: m110,
                      height: m110,
                    ),
                  ),
                ),
                Positioned(
                  left: m184,
                  top: m102,
                  child: Text(
                    _name,
                    style: style_ffffff_34_b,
                  ),
                ),
                Positioned(
                  left: m184,
                  top: m150,
                  child: Text(
                    _sign,
                    style: style_ccffffff_26,
                  ),
                ),
                Positioned(
                  right: m60,
                  top: m135,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: color_ccffffff,
                    size: m30,
                  ),
                ),
              ],
            ),
          ),
          onTap: _onTop('个人信息'),
        ),
      );

  _onTop(String title) => () {
        if (title == '个人信息') {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return UserPage();
          })).then((value) {
            setState(() {});
          });
        }
        if (title == '我的课程') {}
        if (title == '我的消息') {}
        if (title == '给个好评') {
          _toShop();
        }
        if (title == '我要吐槽') {}
        if (title == '关于我们') {}
        if (title == '系统设置') {}
      };

  void _toShop() async {
//    const url = 'tel:17601290637';
    var url = Platform.isAndroid
        ? "market://details?id=com.thor.flutter_qyt"
        : "itms-apps://itunes.apple.com/cn/app/id1144816653?mt=8";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '打开应用商店失败';
    }
  }
}
