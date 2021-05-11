import 'package:flutter/material.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'circle_button.dart';

class AppBackButton extends StatelessWidget {
  final BuildContext mainContext;

  const AppBackButton({Key? key, required this.mainContext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h, vertical: 3.0.h),
        child: CircleButton(
          icon: Assets.svgArrowLeft,
          onTap: () => Get.back(),
        ),
      ),
    );
  }
}
