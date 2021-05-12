import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;
  const WelcomeBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: AppColors.White,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/png/main_top.png",
              width: size.width * 0.3,
              color: AppColors.primaryColor,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/png/main_bottom.png",
              width: size.width * 0.2,
              color: AppColors.primaryColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
