import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/flutter_bounce.dart';

class BouncingAnimation extends StatelessWidget {
  final child;
  final onPressed;
  const BouncingAnimation({Key? key, this.child, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(duration: Duration(milliseconds: 200), onPressed: onPressed, child: child);
  }
}
