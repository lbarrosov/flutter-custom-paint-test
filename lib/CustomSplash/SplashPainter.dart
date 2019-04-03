import 'package:flutter/material.dart';

class SplashPainter extends CustomPainter {

  double fractionTime;

  SplashPainter(this.fractionTime);

  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double width = size.width;

    Paint paint = Paint();
    paint.color = Colors.red[900];

    Path topZone = Path();

    topZone.lineTo(width * fractionTime, 0);
    topZone.lineTo(0, height * fractionTime);
    topZone.close();

    canvas.drawPath(topZone, paint);

    Paint paintBlue = Paint();
    paintBlue.color = Colors.blue[900];
    Path bottomZone = Path();
    bottomZone.moveTo(width, height);
    bottomZone.lineTo(width, height - height * fractionTime);
    bottomZone.lineTo(width - width * fractionTime, height);

    canvas.drawPath(bottomZone, paintBlue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
