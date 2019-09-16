import 'package:flutter/material.dart';
import 'package:flutter_homework/build/bean/squatting_info_bean.dart';
import 'package:flutter_homework/util/ui_utils.dart';

class SquattingInfo extends StatelessWidget {
  List<SquattingInfoBean> _datas = [];

  @override
  Widget build(BuildContext context) {
    _initDatas();
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 221, 221, 1.0),
      appBar: AppBar(
        title: Text(
          'Info',
        ),
        centerTitle: false,
        backgroundColor: Color.fromRGBO(96, 96, 96, 1.0),
      ),
      body: ListView.builder(
        itemBuilder: (buildContext, index) {
          return Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 4.0,
                margin: EdgeInsets.all(20.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _contentWidgets(index),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
                margin: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(110, 175, 153, 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text(
                  _datas[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      fontFamily: UiUtils.FONT_FAMILY),
                ),
              )
            ],
          );
        },
        itemCount: _datas.length,
      ),
    );
  }

  List<Widget> _contentWidgets(int index) {
    List<Widget> _widgets = [];
    SquattingInfoBean _bean = _datas[index];
    _bean.contentBean.forEach((_contentBeans) {
      List<String> _contents = _contentBeans.content;
      bool point = _contentBeans.point;
      _contents.forEach((content) {
        _widgets.add(Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Offstage(
                offstage: !point,
                child: Padding(
                  padding: EdgeInsets.only(right: 5.0, top: 3.0),
                  child: Icon(
                    Icons.brightness_1,
                    size: 10.0,
                  ),
                ),
              ),
              Expanded(
                  child: Text(
                content,
                style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: UiUtils.FONT_FAMILY,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ));
      });
      List<String> iconPaths = _contentBeans.iconPath;
      iconPaths?.forEach((iconPath) {
        _widgets.add(Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Image.asset(iconPath),
          ),
        ));
      });
    });
    return _widgets;
  }

  void _initDatas() {
    _datas.add(_createBean('GUIDELINES', [
      _createContentBean([
        'The goal is to sit in a resting squat position for a total of 30 minutes each day.',
        'Split the time up as needed. Start with smaller sessions, such as 30-90 seconds at a time, for the hips to get used to the position.',
        'If something hurts, STOP!'
      ], point: true)
    ]));
    _datas.add(_createBean('WHY SQUAT?', [
      _createContentBean([
        'Resting in a squat position daily increases hip, ankle and back mobility, which many are lacking due to today’s sitting culture.'
      ])
    ]));
    _datas.add(_createBean('HOW TO SQUAT', [
      _createContentBean(
          [
            'Feet roughly shoulder width apart with toes pointing slightly outwards, adjust as needed to comfortably fit your body.',
            'Relaxed spine.',
            'Sit as deep as you can.',
            'Keep your heels on the floor.'
          ],
          point: true,
          iconPath: ['img/squat-good-form.jpg', 'img/form-heels-up.jpg'])
    ]));
    _datas.add(_createBean('I CAN\'T SQUAT', [
      _createContentBean([
        'If you can’t squat down low, start slow and work yourself there. ',
        'If you’re falling backwards, try holding onto something.'
      ], iconPath: [
        'img/squat-good-form.jpg',
      ], point: true),
      _createContentBean(
          [
            'If you can’t get low enough with your heels flat, prop something under your heels such as a rolled up towel or a book.'
          ],
          point: true,
          iconPath: [
            'img/form-feet-elevated.jpg',
          ])
    ]));
    _datas.add(_createBean('CONTACT', [
      _createContentBean(['Email us', 'Privacy Policy'], point: true)
    ]));
  }

  SquattingInfoBean _createBean(
      String title, List<SquattingInfoContentBean> contentBeans) {
    SquattingInfoBean _bean = SquattingInfoBean();
    _bean.title = title;
    _bean.contentBean = contentBeans;
    return _bean;
  }

  SquattingInfoContentBean _createContentBean(List<String> content,
      {List<String> iconPath, bool point = false}) {
    SquattingInfoContentBean _contentBean = SquattingInfoContentBean();
    _contentBean.content = content;
    _contentBean.iconPath = iconPath == null ? null : iconPath;
    _contentBean.point = point;
    return _contentBean;
  }
}
