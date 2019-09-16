import 'package:flutter/material.dart';
import 'package:flutter_homework/build/squatting/squatting_add_time.dart';
import 'package:flutter_homework/util/routers.dart';
import 'package:flutter_homework/util/ui_utils.dart';

class SquattingHome extends StatefulWidget {
  @override
  _SquattingHomeState createState() => _SquattingHomeState();
}

class _SquattingHomeState extends State<SquattingHome> {
  double _times = 0;
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      key: key,
      backgroundColor: Color.fromRGBO(221, 221, 221, 1.0),
      body: Container(
        height: screenHeight,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
                child: SizedBox(
              width: screenWidth,
              height: screenHeight * 5 / 10,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                  Image.asset(
                    'img/dark-logo.png',
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    '${_times} min',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 42,
                      fontFamily: UiUtils.FONT_FAMILY,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )),
            Positioned(
                top: screenHeight * 5 / 10,
                child: Container(
                  alignment: Alignment.center,
                  width: screenWidth,
                  height: screenHeight / 10,
                  child: Text(
                    '30 out of 30 minutes left',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: UiUtils.FONT_FAMILY,
                        fontSize: 16.0,
                        color: Colors.white),
                  ),
                )),
            Positioned(
              top: screenHeight * 6 / 10,
              child: SquattingAddTime(screenHeight, screenWidth),
            ),
            Positioned(
                top: screenHeight * 7 / 10,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  width: screenWidth * 2,
                  height: screenHeight * 3 / 10 - 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.elliptical(screenWidth, screenHeight * 2 / 10),
                      topRight:
                          Radius.elliptical(screenWidth, screenHeight * 2 / 10),
                    ),
                  ),
                )),
            Positioned(
              top: 30.0 + screenHeight * 7 / 10,
              width: screenWidth,
              child: SizedBox(
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        Routers.routePage(context, Routers.Squatting_Info);
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(110, 175, 153, 1.0),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                      ),
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {},
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(110, 175, 153, 1.0),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.assessment,
                          color: Colors.white,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
