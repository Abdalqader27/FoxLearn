import 'package:flutter/material.dart';
import 'package:foxlearn/common/widgets/back_button.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.0.h),
          child: Text(
            "الإشعارات",
            style: AppTextStyles.title().copyWith(color: AppColors.PRIMARY),
          ),
        ),
        AppBackButton(
          mainContext: context,
        ),
      ],
    );
  }
}
