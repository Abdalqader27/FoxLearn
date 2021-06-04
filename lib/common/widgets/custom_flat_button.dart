import 'package:flutter/material.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFlatButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;

  const CustomFlatButton(
      {Key? key,
      this.title,
      this.onTap,
      this.color,
      this.borderColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(color ?? AppColors.secondaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : BorderSide.none),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.all(1.5.w)),
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: textStyle ??
              AppTextStyles.medium().copyWith(color: theme.shadowColor),
        ));
  }
}
