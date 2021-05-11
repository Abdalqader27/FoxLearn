import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextStyles {
  static double? verySmallSp;
  static double? smallSp;
  static double? mediumSp;
  static double? listTitleSp;
  static double? titleSp;
  static init() {
    verySmallSp = Adaptive.sp(6);
    smallSp = Adaptive.sp(8);
    mediumSp = Adaptive.sp(11);
    listTitleSp = Adaptive.sp(14);
    titleSp = Adaptive.sp(20);
  }

  static TextStyle verySmall({FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: 6.0.sp, fontFamily: 'sst-arabic', fontWeight: fontWeight);
  }

  static TextStyle small({FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: 7.5.sp, fontFamily: 'sst-arabic', fontWeight: fontWeight);
  }

  static TextStyle medium({FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: 11.0.sp, fontFamily: 'sst-arabic', fontWeight: fontWeight);
  }

  static TextStyle title({FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 15.0.sp,
      fontWeight: fontWeight ?? FontWeight.bold,
      fontFamily: 'sst-arabic',
    );
  }
}
