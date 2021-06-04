import 'package:flutter/material.dart';
import 'package:foxlearn/common/animation/bouncing_animation.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SimpleButton extends StatelessWidget {
  final text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;

  const SimpleButton(
      {Key? key, this.text, this.onTap, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(_) => BouncingAnimation(
        onPressed: onTap,
        child: Center(
            child: Container(
          color: color,
          child: GestureDetector(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text("$text", style: AppTextStyles.medium())),
          ),
        )),
      );
}
