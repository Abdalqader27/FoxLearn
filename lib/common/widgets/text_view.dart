import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextView extends StatelessWidget {
  final text;
  final bool isTitle;

  const TextView({Key? key, this.text, this.isTitle = true}) : super(key: key);

  @override
  Widget build(_) => Center(
          child: Text(
        "$text",
        style: isTitle
            ? TextStyle(fontSize: 19.0.sp, fontWeight: FontWeight.w600)
            : TextStyle(
                fontSize: 10.0.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.Black.withOpacity(.5)),
      ));
}
