import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color color;

  RPSCustomPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0002000, size.height * 0.4996000);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.4984000);
    path_0.quadraticBezierTo(size.width * 0.7498000, size.height * 0.3989000,
        size.width * 0.5016000, size.height * 0.4024000);
    path_0.quadraticBezierTo(size.width * 0.2486500, size.height * 0.3976000,
        size.width * 0.0002000, size.height * 0.4996000);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
