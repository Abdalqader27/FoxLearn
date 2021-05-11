import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/common/widgets/rounded-app-bar.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RootBackground extends StatelessWidget {
  final double marginBottom;
  final bool showAppbar;
  const RootBackground({Key? key, required this.marginBottom, this.showAppbar = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showAppbar
            ? Container(
                height: 26.0.h,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: RPSCustomPainter(AppColors.PRIMARY),
                ),
              )
            : Container(),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: marginBottom.h),
              child: Opacity(
                opacity: .6,
                child: SvgPicture.asset(
                  Assets.svgRootBackground,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
