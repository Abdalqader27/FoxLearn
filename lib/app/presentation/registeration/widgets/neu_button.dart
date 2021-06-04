import 'package:flutter/material.dart';
import 'package:foxlearn/common/animation/bouncing_animation.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class NeuFlatButton extends StatelessWidget {
  final text;
  final VoidCallback? onTap;
  final color;
  final bool expandedWidth;
  final IconData? iconData;

  const NeuFlatButton(
      {Key? key,
      this.text,
      this.onTap,
      this.color,
      this.expandedWidth = false,
      this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expandedWidth ? double.infinity : null,
      child: BouncingAnimation(
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (iconData != null) Spacer(),
              Text("$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp)),
              if (iconData != null)
                Expanded(
                  child: Center(
                    child: Icon(
                      iconData,
                      size: 5.0.w,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
