import 'package:flutter/material.dart';

class TabIndicationPainter extends CustomPainter {
  Paint painter;
  final double radius;
  final EdgeInsets padding;

  final PageController pageController;

  TabIndicationPainter(
    this.pageController, {
    this.radius = 25.0,
    this.padding,
  }) : super(repaint: pageController) {
    painter = new Paint()
      ..color = Color(0xFFFFFFFF)
      ..style = PaintingStyle.fill;
  }

  //maxScrollExtent最大滑动距离(总屏数-1)
  //minScrollExtent最小滑动距离
  //viewportDimension每屏大小
  //extentBefore滑动的位置（min~max）
  //fullExtent总屏大小
  @override
  void paint(Canvas canvas, Size size) {
    final pos = pageController.position;
    double fullExtent =
        (pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension);
    double pageOffset = pos.extentBefore / fullExtent;
    Path path = new Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(0, 0, size.width / 2, size.height),
        Radius.circular(radius),
      ),
    );
    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(TabIndicationPainter oldDelegate) => true;
}
