import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class Circle extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Color backGroundColor;
  final Function onTap;
  final double dim;
  final double widthOfBorder;
  const Circle({Key key, this.dim, this.borderColor, this.backGroundColor,  this.child, this.onTap, this.widthOfBorder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: dim.w,
        height: dim.h,
        child: child,
        decoration: BoxDecoration(
          border: Border.all(width: widthOfBorder?? 2.5,color: borderColor),
          color: backGroundColor,
          shape: BoxShape.circle
        ),
      ),
    );
  }

}
