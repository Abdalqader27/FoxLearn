import 'package:flutter/material.dart';

class PrimaryBackground extends StatelessWidget {
  final Widget child;
  const PrimaryBackground({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Image.asset(
          //     "assets/png/signup_top.png",
          //     width: size.width * 0.35,
          //   ),
          // ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/png/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
