import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_homework/main/home.dart';
import 'package:flutter_homework/util/ui_utils.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
        ),
        body: GuideWidget(),
      ),
    ));

class GuideWidget extends StatefulWidget {
  @override
  _GuideWidgetState createState() => _GuideWidgetState();
}

class _GuideWidgetState extends State<GuideWidget> {
  void _toBeStronger() async {
    await showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            title: Text(
              '提示：',
              style: TextStyle(
                fontFamily: 'fanxinshu',
              ),
            ),
            content: Text(
              '你想变强吗？',
              style: TextStyle(
                fontFamily: 'fanxinshu',
                fontSize: 24,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(buildContext).pop();
                  _tellMeSex('我看好你！先教你第一招：你的性别');
                },
                child: Text(
                  '想',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'fanxinshu',
                    fontSize: 18,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(buildContext).pop();
                  _tellMeSex('同志，你的思想很危险啊！我需要开导开导你：你的性别');
                },
                child: Text(
                  '不想',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'fanxinshu',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _tellMeSex(String msg) async {
    await showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            title: Text(
              '提示：',
              style: TextStyle(
                fontFamily: 'fanxinshu',
              ),
            ),
            content: Text(
              msg,
              style: TextStyle(
                fontFamily: 'fanxinshu',
                fontSize: 24,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  UiUtils.taost(buildContext, '这位小仙女，我一看你就是天资聪颖、心灵手巧、人美心善之人',
                      onDestory: () {
                    Navigator.pushAndRemoveUntil(context, PageRouteBuilder(
                        pageBuilder:
                            (pageContext, animation, secondaryAnimation) {
                      return HomeWidget();
                    }), (router) => false);
                  });
                  Navigator.of(buildContext).pop();
                },
                child: Text(
                  '女',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'fanxinshu',
                    fontSize: 18,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  UiUtils.taost(buildContext, '学你妈嗨，滚！！！', onDestory: () {
                    exit(0);
                  });
                },
                child: Text(
                  '男',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'fanxinshu',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () => _toBeStronger(),
        color: Colors.white,
        child: Text(
          '学',
          style: TextStyle(
            fontFamily: 'fanxinshu',
            fontSize: 72,
          ),
        ),
      ),
    );
  }
}
