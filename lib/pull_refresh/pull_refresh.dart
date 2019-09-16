import 'dart:async';

import 'package:flutter/material.dart';

class PullRefresh extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PullRefresh> with TickerProviderStateMixin {
  static const _MAX_OFFSET_HEIGHT = 100.0;
  static const _TRIGGER_HEIGHT = 80.0;
  double _offsetHeight = 0;
  Animation<double> _reductionAnimation;
  AnimationController _reductionController;
  Animation<double> _blingTextAnimation;
  AnimationController _blingTextController;
  bool _animatorReset = false;
  AxisDirection _scrollAxis;

  double _getRealHeight(AxisDirection direction) {
    double realHeight = 0;
    if (direction == _scrollAxis) {
      if (_scrollAxis == AxisDirection.down) {
        if (_offsetHeight.abs() > _MAX_OFFSET_HEIGHT) {
          _offsetHeight = -_MAX_OFFSET_HEIGHT;
        }
        realHeight = _offsetHeight.abs();
      } else if (_scrollAxis == AxisDirection.up) {
        if (_offsetHeight.abs() > _MAX_OFFSET_HEIGHT) {
          _offsetHeight = _MAX_OFFSET_HEIGHT;
        }
        realHeight = _offsetHeight.abs();
      }
    }
    return realHeight;
  }

  void startRefresh() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      _reductionController.forward();
      timer.cancel();
    });
  }

  @override
  void initState() {
    _reductionController =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    _reductionAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_reductionController)
          ..addListener(() {
            if (_animatorReset) {
              return;
            }
            setState(() {
              _offsetHeight = _reductionAnimation.value * _offsetHeight;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animatorReset = true;
              _offsetHeight = 0;
              _reductionController.reset();
              _blingTextController.stop();
            }
          });
    _blingTextController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _blingTextAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_blingTextController);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: NotificationListener(
          onNotification: (ScrollNotification onNotification) {
            switch (onNotification.runtimeType) {
              case ScrollStartNotification:
                break;
              case ScrollUpdateNotification:
                break;
              case ScrollEndNotification:
                _animatorReset = false;
                if (_offsetHeight.abs() >= _TRIGGER_HEIGHT) {
                  setState(() {
                    startRefresh();
                  });
                } else {
                  _reductionController.forward();
                }
                break;
              case OverscrollNotification:
                OverscrollNotification overscrollNotification = onNotification;
                if (overscrollNotification.velocity != 0.0) {
                  return;
                }
                _blingTextController.repeat();
                _offsetHeight += overscrollNotification.overscroll / 2;
                _scrollAxis =
                    _offsetHeight > 0 ? AxisDirection.up : AxisDirection.down;
                if (_offsetHeight.abs() <= _MAX_OFFSET_HEIGHT) {
                  setState(() {});
                }
                break;
            }
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: _getRealHeight(AxisDirection.down),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blueAccent,
                  child: AnimatedBuilder(
                      animation: _blingTextAnimation,
                      builder: (buildContext, widget) {
                        Gradient gradient = LinearGradient(
                          colors: [
                            Colors.greenAccent,
                            Colors.white,
                            Colors.greenAccent
                          ],
                          stops: [
                            _blingTextAnimation.value - 0.2,
                            _blingTextAnimation.value,
                            _blingTextAnimation.value + 0.2
                          ],
                        );
                        Shader shader = gradient.createShader(
                            Rect.fromLTWH(0, 0, size.width, size.height));
                        return Text(
                          '为每一份创造价值',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            foreground: Paint()..shader = shader,
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemBuilder: (buildContext, index) {
                  return Container(
                    color: Colors.pinkAccent,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20.0),
                    child: Text('test'),
                  );
                },
                itemCount: 20,
              )),
              SizedBox(
                width: double.infinity,
                height: _getRealHeight(AxisDirection.up),
                child: Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Text(
                    '上拉加载更多',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
