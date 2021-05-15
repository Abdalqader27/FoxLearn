import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final kSearchInputDecoration = InputDecoration(
    border: InputBorder.none,
    prefixIcon: SizedBox(
      width: 10.0.w,
      child: Center(
        child: SvgPicture.asset(
          Assets.svgSearch,
          width: 5.w,
        ),
      ),
    ),
    prefixIconConstraints: BoxConstraints(
      minWidth: 0,
      minHeight: 0,
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 1.0.w,
      horizontal: 2.0.w,
    ));
