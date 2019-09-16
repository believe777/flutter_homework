import 'package:flutter/material.dart';
import 'package:flutter_homework/build/squatting/squatting_sheet.dart';
import 'package:flutter_homework/util/ui_utils.dart';

class SquattingAddTime extends StatefulWidget {
  SquattingAddTime(this._height,this._width);

  final double _height;
  final double _width;

  @override
  _SquattingAddTimeState createState() => _SquattingAddTimeState();
}

class _SquattingAddTimeState extends State<SquattingAddTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget._height / 10,
      child: RaisedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (buildContext) {
                return SquattingSheet(widget._height,widget._width);
              });
        },
        color: Color.fromRGBO(110, 175, 153, 1.0),
        padding: EdgeInsets.only(
          left: 80.0,
          right: 80.0,
          top: 20.0,
          bottom: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          'ADD TIME',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: UiUtils.FONT_FAMILY,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
