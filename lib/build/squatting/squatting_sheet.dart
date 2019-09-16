import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/util/ui_utils.dart';

enum BtnChoose {
  LEFT,
  RIGHT,
}

class SquattingSheet extends StatefulWidget {
  SquattingSheet(this._height, this._width);

  final double _height;
  final double _width;

  @override
  _SquattingSheetState createState() => _SquattingSheetState();
}

class _SquattingSheetState extends State<SquattingSheet> {
  BtnChoose _btnChoose = BtnChoose.LEFT;
  Timer _timer;
  int _minute = 0;
  int _seconds = 0;
  int _milliSeconds = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._height / 2,
      color: Color.fromRGBO(221, 221, 221, 1.0),
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0.0,
              height: widget._height / 10,
              width: widget._width,
              child: Center(
                child: Text(
                  'Use the timer or time picker to log time',
                  style: TextStyle(fontFamily: UiUtils.FONT_FAMILY, fontSize: 14.0),
                ),
              )),
          Positioned(
              top: widget._height / 10,
              width: widget._width,
              height: widget._height / 10,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 10.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_btnChoose == BtnChoose.RIGHT) {
                            setState(() {
                              _btnChoose = BtnChoose.LEFT;
                            });
                          }
                        },
                        color: _btnChoose == BtnChoose.LEFT ? Color.fromRGBO(110, 175, 153, 1.0) : Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'TIMER',
                          style: TextStyle(
                            color: _btnChoose == BtnChoose.LEFT ? Colors.white : Colors.black,
                            fontSize: 18.0,
                            fontFamily: UiUtils.FONT_FAMILY,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 20.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_btnChoose == BtnChoose.LEFT) {
                            setState(() {
                              _cancelTimer();
                              _btnChoose = BtnChoose.RIGHT;
                            });
                          }
                        },
                        color: _btnChoose == BtnChoose.RIGHT ? Color.fromRGBO(110, 175, 153, 1.0) : Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'TIME PICKER',
                          style: TextStyle(
                            color: _btnChoose == BtnChoose.RIGHT ? Colors.white : Colors.black,
                            fontSize: 18.0,
                            fontFamily: UiUtils.FONT_FAMILY,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              )),
          Positioned(
            top: widget._height * 2 / 10,
            left: -widget._width / 2,
            child: timerWidget(widget._width),
          ),
          Positioned(
            top: widget._height * 2 / 10,
            width: widget._width,
            height: widget._height * 3 / 10,
            child: timePickerWidget(widget._width),
          ),
        ],
      ),
    );
  }

  Widget timerWidget(double width) {
    return Offstage(
      offstage: !(_btnChoose == BtnChoose.LEFT),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            width: width * 2,
            height: widget._height * 3 / 10 - 60,
            margin: EdgeInsets.only(top: 60.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(width, widget._height * 2 / 10),
                  topRight: Radius.elliptical(width, widget._height * 2 / 10),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _finalTime(),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: UiUtils.FONT_FAMILY,
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle_outline,
                        size: 12.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          'ADD TIME',
                          style: TextStyle(fontSize: 12.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 30.0,
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _minute = 0;
                        _seconds = 0;
                        _milliSeconds = 0;
                      });
                    },
                    padding: EdgeInsets.all(15.0),
                    color: Colors.white,
                    shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    child: Icon(Icons.replay),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_timer != null && _timer.isActive) {
                        return;
                      }
                      _timer = startTimer();
                    },
                    color: Colors.white,
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    child: Icon(Icons.play_arrow),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_timer != null && _timer.isActive) {
                        setState(() {
                          _timer.cancel();
                        });
                      }
                    },
                    color: Colors.white,
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    child: Icon(Icons.stop),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget timePickerWidget(double width) {
    return Offstage(
      offstage: !(_btnChoose == BtnChoose.RIGHT),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
              left: -width / 2,
              top: 60.0,
              child: Container(
                width: width * 2,
                height: widget._height * 3 / 10 - 60,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.elliptical(width, widget._height * 2 / 10),
                      topLeft: Radius.elliptical(width, widget._height * 2 / 10),
                    )),
                child: CupertinoTimerPicker(
                  onTimerDurationChanged: (duration) {},
                  mode: CupertinoTimerPickerMode.ms,
                ),
              )),
          Positioned(
            top: 30.0,
            child: RaisedButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 12.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'ADD TIME',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Timer startTimer() {
    return Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_milliSeconds == 99) {
          _milliSeconds = 0;
          if (_seconds == 59) {
            _minute++;
            _seconds = 0;
          } else {
            _seconds++;
          }
        } else {
          _milliSeconds++;
        }
      });
    });
  }

  String _finalTime() {
    String final_minute = _minute >= 10 ? _minute.toString() : '0${_minute.toString()}';
    String finalSecond = _seconds >= 10 ? _seconds.toString() : '0${_seconds.toString()}';
    String finalMiliSecond = _milliSeconds >= 10 ? _milliSeconds.toString() : '0${_milliSeconds.toString()}';
    return '$final_minute:$finalSecond:$finalMiliSecond';
  }

  void _cancelTimer() {
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }
}
