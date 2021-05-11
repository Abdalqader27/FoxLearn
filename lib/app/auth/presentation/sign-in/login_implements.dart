import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/widgets/sgin-in-form.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginImplements {
  final imageLogin = SvgPicture.asset(
    Assets.svgLogin,
    width: 50.0.w,
    height: 20.0.h,
  );

  Widget loginSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
      child: SignForm(),
    );
  }
}
