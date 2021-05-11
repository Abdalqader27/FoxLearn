import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final bool selectedGender;
  final bool myGender;
  final onPressed;

  const RadioButton(
      {Key? key,
      required this.title,
      required this.selectedGender,
      required this.myGender,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10.0.sp),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 2.0.w),
        child: Text(
          title,
          style: AppTextStyles.medium()
              .copyWith(color: myGender ^ selectedGender ? AppColors.LIGHT_BLACK : AppColors.WHITE),
        ),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.ACCENT),
            boxShadow: [AppStyles.lightBoxShadow],
            borderRadius: AppStyles.borderRadiusAll(25.0),
            color: myGender ^ selectedGender ? AppColors.WHITE : AppColors.ACCENT),
      ),
    );
  }
}
