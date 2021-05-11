import 'package:flutter/material.dart';

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.079710, size.height * 0.2499964);
    path_0.cubicTo(
        size.width * 0.8109493,
        size.height * -0.1261402,
        size.width * 0.1082476,
        size.height * -0.03759651,
        size.width * -0.08212560,
        size.height * 0.2499964);
    path_0.lineTo(size.width * -0.08212560, size.height);
    path_0.lineTo(size.width * 1.079710, size.height);
    path_0.lineTo(size.width * 1.079710, size.height * 0.2499964);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff6479F6).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
