import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CountCard extends StatelessWidget {
  final String buttonText;

  const CountCard({Key? key, required this.buttonText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppStyles.borderRadiusT,
      shadowColor: AppColors.ACCENT,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 2.0.w),
        decoration: BoxDecoration(borderRadius: AppStyles.borderRadiusT, color: AppColors.ACCENT),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
          child: Text(buttonText,
              style: AppTextStyles.medium(fontWeight: FontWeight.bold)
                  .copyWith(color: AppColors.LIGHT_BLACK, fontSize: 13.0.sp)),
        ),
      ),
    );
  }
}
