import 'dart:async';

import 'package:flutter/material.dart';

class UiUtils {
  static const FONT_FAMILY = 'fanxinshu';

  static void taost(BuildContext context, String msg, {Function onDestory}) {
    OverlayEntry overlayEntry = OverlayEntry(builder: (buildContext) {
      return _ToastWidget(msg);
    });
    Overlay.of(context).insert(overlayEntry);
    Timer.periodic(Duration(seconds: 1), (timer) {
      overlayEntry.remove();
      timer.cancel();
      if (onDestory != null) {
        onDestory();
      }
    });
  }
}

class _ToastWidget extends StatefulWidget {
  _ToastWidget(this.msg);

  final String msg;

  @override
  __ToastWidgetState createState() => __ToastWidgetState();
}

class __ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: theme.primaryTextTheme,
      platform: theme.platform,
    );
    return FadeTransition(
      opacity:
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                    child: Opacity(
                  opacity: 0.9,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 32.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkTheme.backgroundColor,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Center(
                        child: Text(
                          widget.msg,
                          softWrap: true,
                          style: darkTheme.textTheme.body2,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
