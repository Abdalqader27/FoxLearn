import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  final onPressed;
  final String buttonText;

  const AppButton({Key? key, required this.onPressed, required this.buttonText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: AppColors.RED,
          elevation: 2,
          shadowColor: AppColors.RED,
          shape: RoundedRectangleBorder(borderRadius: AppStyles.borderRadiusT)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.sp),
        child: Text(buttonText,
            style: AppTextStyles.medium().copyWith(
              color: AppColors.WHITE,
            )),
      ),
      onPressed: onPressed,
    );
  }
}
