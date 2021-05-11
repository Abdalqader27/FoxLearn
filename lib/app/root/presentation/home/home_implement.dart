import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/paths.dart';
import 'package:foxlearn/resources/values/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeImplements {
  Widget imageTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 2.0.h),
        SvgPicture.asset(AppPaths.home_image),
        SizedBox(height: 1.0.h),
      ],
    );
  }

  Widget commonSessionTitle() {
    return Text(
      AppString.COMMON_SESSION,
      style: AppTextStyles.medium(fontWeight: FontWeight.bold),
    );
  }
}
