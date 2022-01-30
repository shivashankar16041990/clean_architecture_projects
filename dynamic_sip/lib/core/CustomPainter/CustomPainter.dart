import 'package:vector_math/vector_math.dart';
import 'dart:math' ;
import 'dart:ui';
import 'package:flutter/material.dart';
class MyPainter extends CustomPainter{
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;




  MyPainter({required this.completePercent,
    required this.lineColor,
    required this.width,
    required this.completeColor


  });











  @override
  void paint(Canvas canvas, Size size) {
    // print(pi);
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
    //  ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center  = new Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle =radians(completePercent*360/100);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -(pi)/2,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}