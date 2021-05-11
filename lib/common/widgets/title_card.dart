import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final double width;

  const TitleCard({Key? key, required this.title, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: width,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 2.0.h),
          padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 2.0.h),
          child: Text(
            title,
            style: AppTextStyles.medium().copyWith(color: AppColors.White),
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: AppStyles.borderRadiusAll(10.0),
          )),
    );
  }
}
