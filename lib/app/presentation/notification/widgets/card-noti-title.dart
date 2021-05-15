import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationTitle extends StatelessWidget {
  final String title;

  const NotificationTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.svgNotification,
          color: AppColors.ACCENT,
        ),
        SizedBox(
          width: 5.0.sp,
        ),
        Text(
          title,
          style: AppTextStyles.medium(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
