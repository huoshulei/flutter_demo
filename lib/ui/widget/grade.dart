import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_qyt/values/values.dart';


class GradeWidget extends StatefulWidget {
  final title = '年级';

  @override
  State<StatefulWidget> createState() {
    return _GradeState(title);
  }
}

class _GradeState extends State<GradeWidget> {
  var title;
  var icon = Icons.expand_more;

  _GradeState(this.title);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icon = Icons.expand_less;
        });
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) {
            return GradePage();
          }),
        ).then((value) {
          setState(() {
            if (value != null) title = value;
            icon = Icons.expand_more;
          });
        });
      },
      child: Row(
        children: <Widget>[
          Text(title, style: style_222831_28),
          Icon(icon, color: color_dd888888, size: s36)
        ],
      ),
    );
  }
}

class GradePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GradeSelectedWidgetState();
  }
}

class _GradeSelectedWidgetState extends State<GradePage> {
  var _currentItem = '4';
  var _currentSemester = '11';
  var title = '11111111';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        padding: EdgeInsetsDirectional.only(end: m30),
        trailing: IconButton(
          padding: EdgeInsets.only(left: m10, top: m10, bottom: m10),
          alignment: Alignment.centerRight,
          icon: Icon(
            Icons.close,
            color: color_dd888888,
          ),
          iconSize: m40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        border: Border(),
//        heroTag:  title,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: m30, top: m26),
            child: Text(
              '选择年级',
              style: style_1a293d_48_b,
            ),
          ),
          _titleView('选择学期'),
          Container(
            margin: EdgeInsets.only(left: m30, top: m40, right: m30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _semesterView('上学期', '11'),
                _semesterView('下学期', '12'),
                SizedBox(width: m210)
              ],
            ),
          ),
          _titleView('小学阶段'),
          Container(
            margin: EdgeInsets.only(left: m30, top: m40, right: m30),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: m30,
              children: <Widget>[
                _itemView('一年级', '1'),
                _itemView('二年级', '2'),
                _itemView('三年级', '3'),
                _itemView('四年级', '4'),
                _itemView('五年级', '5'),
                _itemView('六年级', '6'),
              ],
            ),
          ),
          _titleView('初中阶段'),
          Container(
            margin: EdgeInsets.only(left: m30, top: m40, right: m30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _itemView('七年级', '7'),
                _itemView('八年级', '8'),
                _itemView('九年级', '9'),
              ],
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: m30, right: m30),
            child: MaterialButton(
              child: Text('我选好啦'),
              textColor: color_ffffffff,
              disabledTextColor: color_ffffffff,
              disabledColor: color_7633a1ff,
              color: color_33a1ff,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(m43)),
              height: m86,
              minWidth: m690,
              onPressed: () {
                Navigator.pop(context, _currentItem);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _titleView(String title) => Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(left: m30, top: m80),
        child: Text(title, style: style_8c99a9_30),
      );

  Widget _itemView(String title, String key) => GestureDetector(
        child: Container(
          width: m210,
          height: m80,
          child: Center(
            child: Text(title,
                style: _currentItem == key ? style_33a1ff_30 : style_535f6e_30),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(m40),
              color: _currentItem == key ? color_e6f4ff : color_fff7f7f7,
              border: Border.all(
                  color: _currentItem == key ? color_33a1ff : color_ffcccccc,
                  width: m1)),
        ),
        onTap: () {
          setState(() {
            _currentItem = key;
            title = key;
          });
        },
      );

  Widget _semesterView(String title, String key) => GestureDetector(
        child: Container(
          width: m210,
          height: m80,
          child: Center(
            child: Text(title,
                style: _currentSemester == key
                    ? style_33a1ff_30
                    : style_535f6e_30),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(m40),
              color: _currentSemester == key ? color_e6f4ff : color_fff7f7f7,
              border: Border.all(
                  color:
                      _currentSemester == key ? color_33a1ff : color_ffcccccc,
                  width: m1)),
        ),
        onTap: () {
          this.setState(() {
            _currentSemester = key;
          });
        },
      );
}
