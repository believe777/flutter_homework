import 'package:flutter/material.dart';
import 'package:flutter_homework/util/routers.dart';
import 'package:flutter_homework/util/ui_utils.dart';

class HomeWidget extends StatelessWidget {
  static const RouteList = {
    Routers.Pull_Refresh: '下拉刷新',
    Routers.Gorgeous_Login: '华丽的登录',
    Routers.Squatting_Welcome: '蹲下，双手抱头',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('目录'),
        ),
        body: ListView(
          children: _createItems(context),
        ),
      ),
      routes: Routers.initRouter(),
    );
  }

  List<Widget> _createItems(BuildContext context) {
    List<Widget> _list = [];
    RouteList.forEach((key, value) {
      _list.add(GestureDetector(
        onTap: () {
          Routers.routePage(context, key);
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: UiUtils.FONT_FAMILY),
          ),
        ),
      ));
    });
    return _list;
  }
}
