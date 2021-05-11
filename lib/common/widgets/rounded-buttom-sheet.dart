import 'package:flutter/material.dart';

class BottomSheetPainter extends CustomPainter {
  final Color color;

  BottomSheetPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0010000, size.height * 0.4980000);
    path_0.quadraticBezierTo(size.width * 0.2495500, size.height * 0.1729000,
        size.width * 0.4996000, size.height * 0.1792000);
    path_0.quadraticBezierTo(size.width * 0.7500000, size.height * 0.1783000,
        size.width, size.height * 0.4956000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width * 0.0010000, size.height * 0.4980000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
