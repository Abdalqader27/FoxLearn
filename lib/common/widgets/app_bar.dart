import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/common/animation/bouncing_animation.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';


class AppBarUser extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? textColor;
  const AppBarUser({Key? key, this.text, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Container(
          height: 7.0.h,
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Container(
                child: Container(
                    decoration: BoxDecoration(
                        color: color ?? AppColors.LIGHT_Red,
                        borderRadius: BorderRadius.circular(15.0.w)),
                    padding: EdgeInsets.all(5.0.sp),
                    child: Center(
                        child: Text(
                      "$text",
                      style: AppTextStyles.medium(fontWeight: FontWeight.w700)
                          .copyWith(color: textColor ?? Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ))),
              )),
              SizedBox(
                width: 1.5.h,
              ),
              BouncingAnimation(
                onPressed: () => Get.back(),
                child: Container(
                  child: Container(
                      height: 7.0.h,
                      width: 7.0.h,
                      decoration: BoxDecoration(
                          color: color ?? AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15.0.w)),
                      child: Icon(Icons.arrow_forward_ios,
                          size: 14.0.sp, color: textColor == null ? AppColors.White : textColor)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
