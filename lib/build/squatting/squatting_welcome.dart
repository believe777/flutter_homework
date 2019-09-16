import 'package:flutter/material.dart';
import 'package:flutter_homework/util/routers.dart';
import 'package:flutter_homework/util/ui_utils.dart';

class SquattingWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 221, 221, 1.0),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Container(
              width: screenWidth,
              padding: EdgeInsets.only(top: 20.0, bottom: 70.0),
              margin: EdgeInsets.only(bottom: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(screenWidth / 2, 20),
                  topRight: Radius.elliptical(screenWidth / 2, 20),
                  bottomLeft: Radius.elliptical(screenWidth / 2, 20),
                  bottomRight: Radius.elliptical(screenWidth / 2, 20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                      fontFamily: UiUtils.FONT_FAMILY,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'squatting',
                    style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                      fontFamily: UiUtils.FONT_FAMILY,
                      fontSize: 65.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rest in squat position for 30\nminutes each day to increase\nhip,ankle and back mobility.',
                    style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1.0),
                      fontFamily: UiUtils.FONT_FAMILY,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Routers.routePage(context, Routers.Squatting_Home);
              },
              splashColor: Colors.transparent,
              color: Color.fromRGBO(110, 175, 153, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              child: SizedBox(
                width: screenWidth - 100,
                child: Text(
                  'START\nSQUATTING',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiUtils.FONT_FAMILY,
                      fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
