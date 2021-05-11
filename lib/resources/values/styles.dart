import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppStyles {
  static BorderRadius borderRadiusB = BorderRadius.only(
      topRight: Radius.circular(30.0.sp),
      bottomLeft: Radius.circular(25.0.sp),
      topLeft: Radius.circular(25.0.sp));

  static BorderRadius borderRadiusT = BorderRadius.only(
    bottomLeft: Radius.circular(25.0.sp),
    topLeft: Radius.circular(25.0.sp),
    bottomRight: Radius.circular(30.0.sp),
  );
  static BorderRadius borderRadiusTL = BorderRadius.only(
    bottomLeft: Radius.circular(25.0.sp),
    topRight: Radius.circular(25.0.sp),
    bottomRight: Radius.circular(30.0.sp),
  );

  static BorderRadius borderRadiusAll(double radius) => BorderRadius.all(
        Radius.circular(radius.sp),
      );

  static BoxShadow lightBoxShadow = BoxShadow(
    color: Colors.grey.shade300,
    offset: Offset(1.0, 1.0),
    blurRadius: 7,
    spreadRadius: 1,
  );

  static BoxShadow darkBoxShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(1.0, 1.0),
    blurRadius: 7,
    spreadRadius: 1,
  );
}
