import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditTextForm extends StatelessWidget {
  final title;
  final svgPath;
  final TextEditingController? controller;
  final keyboardType;
  final isPassword;
  final iconColor;
  final nextFocusNode;
  final focusNode;
  final validator;
  final mainContext;
  final maxNumber;
  final marginHorizontal;
  final marginVertical;
  final int? maxLines;
  final VoidCallback? tap;
  final TextInputAction? textInputAction;
  final onChange;
  final Widget? suffixIcon;
  final minLine;

  const EditTextForm(
      {Key? key,
      this.title,
      this.svgPath,
      this.controller,
      this.keyboardType,
      this.isPassword,
      this.nextFocusNode,
      this.focusNode,
      this.mainContext,
      this.iconColor,
      this.validator,
      this.maxNumber,
      this.maxLines = 1,
      this.tap,
      this.marginHorizontal,
      this.marginVertical,
      this.onChange,
      this.textInputAction,
      this.suffixIcon,
      this.minLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
        shape: AppStyles.cardStyle4,
        child: Theme(
          data: Theme.of(context)
              .copyWith(primaryColor: iconColor ?? AppColors.secondaryColor),
          child: TextFormField(
            cursorColor: iconColor ?? AppColors.secondaryColor,
            onTap: tap,
            minLines: minLine ?? 1,
            readOnly: tap != null,
            obscureText: isPassword ?? false,
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLines,
            textInputAction: TextInputAction.newline,
            textAlign: TextAlign.center,
            keyboardType: keyboardType ?? TextInputType.number,
            style: AppTextStyles.medium(),
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 1.0.h, vertical: 1.0.h),
                //  labelStyle: DescriptionStyle.textStyle(13.0.sp,color:iconColor ?? AppColors.secondaryColor ),
                border: InputBorder.none,
                focusColor: iconColor ?? AppColors.secondaryColor,
                hoverColor: iconColor ?? AppColors.secondaryColor,
                icon: svgPath != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1.0.h,
                        ),
                        child: SvgPicture.asset("$svgPath",
                            color: iconColor ?? AppColors.secondaryColor,
                            width: 5.0.w),
                      )
                    : null,
                labelText: title),
            autofocus: false,
            maxLength: maxNumber,
            validator: validator,
            onChanged: onChange,
            onEditingComplete: () {
              if (nextFocusNode != null)
                FocusScope.of(mainContext).requestFocus(nextFocusNode);
              else
                FocusScope.of(mainContext).unfocus();
            },
          ),
        ));
  }
}
