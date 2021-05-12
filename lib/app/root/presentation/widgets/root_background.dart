import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/root/presentation/home/home_bloc/bloc.dart';
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
                height: 22.0.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(),
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  semanticContainer: false,
                  borderOnForeground: false,
                  clipBehavior: Clip.antiAlias,
                  color: AppColors.LIGHT_Red,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                  ),
                ),
                // child: CustomPaint(
                //   painter: RPSCustomPainter(AppColors.LIGHT_Red),
                // ),
              )
            : Container(),
        Expanded(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: marginBottom.h),
              child: Opacity(
                opacity: .3,
                child: SvgPicture.asset(
                  Assets.svgRootBackground,
                  color: AppColors.LIGHT_Red,
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
