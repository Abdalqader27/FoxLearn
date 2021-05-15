import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/common/widgets/rounded-app-bar.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 30.0.h,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: RPSCustomPainter(AppColors.ACCENT),
          ),
        ),
        Expanded(
          child: Opacity(
            opacity: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 18.0.h,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  Assets.svgButtomCard,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
