import 'package:flutter/material.dart';

import 'package:flutter_qyt/ui/widget/app_bar.dart';

class CommPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CommState();
  }
}

class _CommState extends State<CommPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCupertinoNavigationBar('知识清单', tag: 'comm'),
      body: Text('Comm'),
    );
  }
}
