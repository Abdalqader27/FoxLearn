import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class BarPainter extends CustomPainter {
  final Color color;

  BarPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.cubicTo(size.width * 0.5836930, size.height * 0.3373494,
        size.width * 0.1598722, size.height * 0.1405627, 0, 0);
    path_0.lineTo(0, size.height * 0.7951807);
    path_0.cubicTo(
        size.width * 0.4009592,
        size.height * 1.151807,
        size.width * 0.8337338,
        size.height * 0.9437747,
        size.width,
        size.height * 0.7951807);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
