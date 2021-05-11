import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/common/widgets/rounded-app-bar.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 30.0.h,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: RPSCustomPainter(AppColors.PRIMARY),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 20.0.h,
              child: SvgPicture.asset(
                Assets.svgBackgroundCircles,
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}
