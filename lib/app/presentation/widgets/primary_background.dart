import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryBackground extends StatelessWidget {
  final Widget child;

  const PrimaryBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/svg/appBar2.svg",
            ),
          ),
          child,
        ],
      ),
    );
  }
}
