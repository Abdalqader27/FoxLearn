import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: SvgPicture.asset(
                "assets/svg/appBar2.svg",
                height: double.maxFinite,
              ))
        ],
      ),
    );
  }
}
