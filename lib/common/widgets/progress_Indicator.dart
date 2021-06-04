import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foxlearn/resources/theme/colors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class ProgressIndicatorLoading extends StatelessWidget {
  final Color? color;

  const ProgressIndicatorLoading({Key? key, this.color}) : super(key: key);
  @override
  Widget build(_) => SpinKitDualRing(
        lineWidth: 3.5,
        color: color == null ? AppColors.secondaryColor : color!,
        size: 30.0.sp,
      );
}
