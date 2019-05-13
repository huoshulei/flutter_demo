import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qyt/values/values.dart';

class GradePicker extends StatefulWidget {
  final String _grade;

  GradePicker(this._grade);

  @override
  State<StatefulWidget> createState() {
    return _GradeState(this._grade);
  }
}

class _GradeState extends State<GradePicker> {
  var _section;
  var _grade;

  var _list = ['一年级', '二年级', '三年级', '四年级', '五年级', '通用'];
  var _list2 = ['七年级', '八年级', '九年级'];

  _GradeState(this._grade);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _section = _list.contains(_grade) ? '小学' : '初中';
  }

  @override
  Widget build(BuildContext context) {
    var _controller =
        FixedExtentScrollController(initialItem: _defaultItem(_grade));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('取消')),
              MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, _grade);
                  },
                  child: Text('确定')),
            ],
          ),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: color_ffeeeeee, width: m1))),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: m330,
                  child: CupertinoPicker(
                    itemExtent: m40,
                    scrollController: FixedExtentScrollController(
                        initialItem: _section == '小学' ? 0 : 1),
                    backgroundColor: color_fffcfcfc,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        if (value == 0) {
                          _section = '小学';
                        }
                        if (value == 1) {
                          _section = '初中';
                        }
                        _controller.jumpToItem(_defaultItem(_grade));
                      });
                    },
                    children: <Widget>[
                      Text('小学'),
                      Text('初中'),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  height: m330,
                  child: CupertinoPicker(
                    itemExtent: m40,
                    scrollController: _controller,
                    backgroundColor: color_fffcfcfc,
                    onSelectedItemChanged: (value) {
//                      setState(() {
                      if (_section == '小学') {
                        _grade = _list[value];
                      }
                      if (_section == '初中') {
                        _grade = _list2[value];
                      }
//                      });
                    },
                    children: _gradeItems(_section),
                  ),
                )),
          ],
        ),
      ],
    );
  }

  List<Widget> _gradeItems(String section) {
    var items = <Widget>[];
    if (section == '小学') {
      items.add(Text('一年级', style: style_1a293d_30));
      items.add(Text('二年级', style: style_1a293d_30));
      items.add(Text('三年级', style: style_1a293d_30));
      items.add(Text('四年级', style: style_1a293d_30));
      items.add(Text('五年级', style: style_1a293d_30));
      items.add(Text('通用', style: style_1a293d_30));
    }
    if (section == '初中') {
      items.add(Text('七年级', style: style_1a293d_30));
      items.add(Text('八年级', style: style_1a293d_30));
      items.add(Text('九年级', style: style_1a293d_30));
    }
    return items;
  }

  _defaultItem(String grade) {
    if (_section == '小学') {
      var indexOf = _list.indexOf(grade);
      return indexOf >= 0 ? indexOf : 0;
    }
    if (_section == '初中') {
      var indexOf = _list2.indexOf(grade);
      return indexOf >= 0 ? indexOf : 0;
    }
    return 0;
  }
}
