import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyt/ui/mine/grade_picker.dart';
import 'package:flutter_qyt/utils/crop/crop_page.dart';

import 'package:image_picker/image_picker.dart';

import 'package:flutter_qyt/ui/widget/app_bar.dart';
import 'package:flutter_qyt/values/values.dart';


class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserState();
  }
}

class _UserState extends State<UserPage> {
  var _nickName = '孙大剩';
  var _sex = '女';
  var _grade = '三年级';
  var _school = '外蒙古海军学院';
  var _avatar =
      'http://ww1.sinaimg.cn/large/0065oQSqly1frrifts8l5j30j60ojq6u.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_ffffffff,
      appBar: buildCupertinoNavigationBarNor('个人信息',
          context: context,
          tag: 'user',
          previousPageTitle: '个人中心',
          backgroundColor: color_ffffffff),
      body: ListView(
        children: <Widget>[
          _buildAvatar('头像'),
          Divider(indent: m30, color: color_ffeeeeee, height: m1),
          _buildItemWidget('昵称', '修改昵称', content: _nickName),
          Divider(indent: m30, color: color_ffeeeeee, height: m1),
          _buildItemWidget('性别', '选择性别', content: _sex),
          Divider(indent: m30, color: color_ffeeeeee, height: m1),
          _buildItemWidget('年级', '选择年级', content: _grade),
          Divider(indent: m30, color: color_ffeeeeee, height: m1),
          _buildItemWidget('学下', '修改学校', content: _school),
          Divider(indent: m30, color: color_ffeeeeee, height: m1),
        ],
      ),
    );
  }

  Container _buildItemWidget(String title, String defaultContent,
      {String content}) {
    return Container(
      width: double.infinity,
      height: m110,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: m30, right: m30),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Text(title, style: style_8c99a9_30),
            Spacer(),
            Text(content ?? defaultContent,
                style: content == null ? style_8c99a9_30 : style_1a293d_30),
            SizedBox(width: m30),
            Icon(Icons.arrow_forward_ios, color: color_ffcccccc, size: m30)
          ],
        ),
        onTap: _onTop(title),
      ),
    );
  }

  Container _buildAvatar(String title) => Container(
        width: double.infinity,
        height: m110,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: m30, right: m30),
        child: GestureDetector(
          child: Row(
            children: <Widget>[
              Text(title, style: style_8c99a9_30),
              Spacer(),
              ClipOval(
                child: _avatar.startsWith(RegExp('http'))
                    ? FadeInImage.assetNetwork(
                        placeholder: 'assets/icon/mine_avatar.png',
                        image: _avatar,
                        fit: BoxFit.fill,
                        width: m80,
                        height: m80,
                      )
                    : Image.file(File(_avatar)),
              ),
              SizedBox(width: m30),
              Icon(Icons.arrow_forward_ios, color: color_ffcccccc, size: m30)
            ],
          ),
          onTap: _onTop(title),
        ),
      );

  _onTop(String title) => () {
        switch (title) {
          case '头像':
            _showBottomSheet().then((value) {
              setState(() {});
            });
            break;
          case '昵称':
            break;
          case '性别':
            break;
          case '年级':
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return GradePicker(_grade);
                }).then((value) {
              if (value != null){
                setState(() {
                  _grade = value;
                });
              }
            });
            break;
          case '学校':
        }
      };

  ///选择头像
  Future _showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: m332,
            color: color_fff2f2f2,
            child: Column(
              children: <Widget>[
                MaterialButton(
                  height: m110,
                  minWidth: double.infinity,
                  child: Text(
                    '拍照',
                    style: style_222831_30,
                  ),
                  textColor: color_ff222831,
                  onPressed: () async {
                    Navigator.pop(context);
                    var pickImage =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    // 更新新头像
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      var height = MediaQuery.of(context).size.height;
                      var width = MediaQuery.of(context).size.width;
                      return CropPage(pickImage, width, height);
                    })).then((path) {
                      if (path != null) {
                        setState(() {
                          _avatar = path;
                        });
                      }
                    });
                  },
                ),
                Divider(indent: m30, color: color_ffdddddd, height: m1),
                MaterialButton(
                  minWidth: double.infinity,
                  height: m110,
                  child: Text(
                    '从相册选择',
                    style: style_222831_30,
                  ),
                  textColor: color_ff222831,
                  onPressed: () async {
                    Navigator.pop(context);
                    var pickImage = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) {
                      var height = MediaQuery.of(context).size.height;
                      var width = MediaQuery.of(context).size.width;
                      return CropPage(pickImage, width, height);
                    })).then((path) {
                      if (path != null) {
                        setState(() {
                          _avatar = path;
                        });
                      }
                    });
                  },
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: m110,
                  elevation: 0,
                  color: color_ffffffff,
                  child: Text(
                    '取消',
                    style: style_222831_30,
                  ),
                  textColor: color_ff222831,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
