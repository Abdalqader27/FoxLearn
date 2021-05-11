import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcContainerClipper extends CustomPainter {
  final Color color;

  ArcContainerClipper(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    path.moveTo(0.0, 0.07 * size.height);
    final point1 = Offset(size.width * 0.25, 0.0);
    final point2 = Offset(size.width * 0.5, 0.0);
    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);
    final point3 = Offset(size.width * 0.75, 0.0);
    final point4 = Offset(size.width, 0.07 * size.height);
    path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0.0, 0.07 * size.height);
    path.close();

    final paint = Paint()..color = color;
    paint..isAntiAlias = true;
    paint..filterQuality = FilterQuality.high;
    canvas.drawShadow(Path.from(path).shift(Offset(0, -8)), Colors.black.withOpacity(0.2), 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
