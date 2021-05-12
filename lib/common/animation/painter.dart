import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCustomPainter extends CustomPainter {
  final _paint = Paint();
  final Animation<double> _size;
  final Animation<double> _offset;
  final Animation<Color?> _color;
  final beginColor;
  final endColor;

  AnimatedCustomPainter(Animation<double> animation, this.beginColor, this.endColor)
      : _size = Tween<double>(begin: 0, end: 120).animate(animation),
        _offset = Tween<double>(begin: 200, end: 0).animate(animation),
        _color = ColorTween(begin: beginColor, end: endColor).animate(animation),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = _color.value!;
    canvas.drawCircle(
      Offset(
        0,
        size.height,
      ),
      _size.value,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// class StarCustomPainter extends CustomPainter {
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.red
//       ..strokeWidth = 5;
//
//     var path = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(size.width/2, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height/2);
//     path.lineTo(size.width, size.height/2);
//     path.lineTo(0, size.height);
//
//     canvas.drawPath(path, paint);
//   }
//
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
