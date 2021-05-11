import 'package:flutter/material.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final bool showBorder;
  final bool showShadow;
  final Color? borderColor;
  final double height;
  final double width;
  const CircleCard(
      {Key? key,
      required this.backgroundColor,
      required this.child,
      this.showBorder = false,
      this.borderColor,
      this.height = 10.5,
      this.width = 10.5,
      this.showShadow = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: showBorder ? Border.all(width: 1, color: borderColor!) : null,
            boxShadow: showShadow ? [AppStyles.darkBoxShadow] : null,
            color: backgroundColor,
            shape: BoxShape.circle),
        padding: EdgeInsets.all(8.0.sp),
        height: height.w,
        width: width.w,
        child: child);
  }
}
