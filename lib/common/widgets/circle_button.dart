import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleButton extends StatelessWidget {
  final void Function() onTap;
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final double height, width;
  final double contentPadding;
  const CircleButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.backgroundColor = AppColors.WHITE,
      this.height = 11.5,
      this.width = 11.5,
      this.iconColor = AppColors.LIGHT_BLACK,
      this.contentPadding = 10.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [AppStyles.darkBoxShadow], color: backgroundColor, shape: BoxShape.circle),
        padding: EdgeInsets.all(contentPadding.sp),
        height: height.w,
        width: width.w,
        child: SvgPicture.asset(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
