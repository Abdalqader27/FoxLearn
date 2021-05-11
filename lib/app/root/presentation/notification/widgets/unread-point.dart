import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UnreadPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.0.sp,
      height: 7.0.sp,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.RED, boxShadow: [AppStyles.darkBoxShadow]),
    );
  }
}
