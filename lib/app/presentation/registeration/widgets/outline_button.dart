import 'package:flutter/material.dart';
import 'package:foxlearn/common/animation/bouncing_animation.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OutlineNeuButton extends StatelessWidget {
  final text;
  final VoidCallback? onTap;

  const OutlineNeuButton({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) => BouncingAnimation(
        onPressed: onTap,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$text",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.secondaryColor, fontSize: 12.0.sp)),
            )),
      );
}
