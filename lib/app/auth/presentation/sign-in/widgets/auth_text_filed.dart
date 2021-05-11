import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

///-> A
class AuthTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final onSubmit;
  final Function? onTap;
  final Function? onTapIcon;
  final bool? obscure;
  final bool? autoFocus;
  final bool? errorState;
  final bool? disable;
  final String? Function(String?)? validator;
  final Function? onChange;
  final String? svgPath;
  final String? hintText;
  final TextInputType? inputType;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? suffixText;
  final int? maxLength;
  final Color? iconColor;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;
  final Color backgroundColor;
  final Color textColor;
  final int? maxLines;

  AuthTextFormFiled(
      {Key? key,
      this.controller,
      this.onSubmit,
      this.validator,
      this.obscure = false,
      this.errorState = false,
      this.svgPath,
      this.onTap,
      this.onChange,
      this.autoFocus = false,
      this.inputAction,
      this.onTapIcon,
      this.inputType,
      this.focusNode,
      this.disable = false,
      this.initialValue,
      this.suffixText,
      this.maxLength,
      this.inputFormatter,
      this.iconColor,
      this.suffixIcon,
      this.backgroundColor = AppColors.WHITE,
      this.hintText,
      this.textColor = AppColors.LIGHT_BLACK,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0.sp),
      decoration: decoration(backgroundColor),
      child: TextFormField(
          onFieldSubmitted: onSubmit,
          obscureText: obscure!,
          focusNode: focusNode,
          initialValue: initialValue,
          enabled: !disable!,
          controller: controller,
          textInputAction: inputAction,
          keyboardType: inputType,
          validator: validator!,
          maxLines: maxLines,
          autofocus: autoFocus!,
          style: AppTextStyles.medium().copyWith(color: textColor),
          onChanged: (value) => onChange,
          maxLength: maxLength,
          cursorColor: AppColors.PRIMARY,
          inputFormatters: inputFormatter,
          decoration: inputDecoration(hintText, textColor)),
    );
  }

  dynamic inputDecoration(String? hintText, Color? textColor) {
    return InputDecoration(
        isDense: true,
        suffixIcon: suffixIcon,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        focusedBorder: focusedBorder(),
        focusedErrorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        suffixText: suffixText,
        // errorStyle: AppTextStyles.small(),
        counterText: '',
        hintText: hintText,
        hintStyle: AppTextStyles.medium().copyWith(color: textColor),
        icon: svgPath != null ? icon() : null);
  }

  dynamic focusedBorder() {
    return OutlineInputBorder(
        borderRadius: AppStyles.borderRadiusAll(10.0),
        borderSide: BorderSide(color: AppColors.PRIMARY, width: 0.7));
  }

  dynamic icon() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SvgPicture.asset("$svgPath",
          color: iconColor ?? AppColors.PRIMARY, width: 15.0, height: 15.0),
    );
  }

  dynamic decoration(Color color) {
    return BoxDecoration(
      border: Border.all(width: 0.7, color: AppColors.PRIMARY),
      color: color,
      //    boxShadow: [AppStyles.lightBoxShadow],
      borderRadius: AppStyles.borderRadiusAll(10.0),
    );
  }
}
