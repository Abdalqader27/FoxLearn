import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class AuthTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onSubmit;
  final Function? onTap;
  final Function? onTapIcon;
  final bool obscure;
  final bool autofocus;
  final bool errorState;
  final bool disable;
  final String? Function(String?)? validator;
  final Function? onChange;
  final String? svgPath;
  final TextInputType? inputType;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? suffixText;
  final int? maxLength;
  final Color? iconColor;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? inputAction;
  final Widget? suffixIcon;

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
      this.autofocus = false,
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
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TextFormField(
        onFieldSubmitted: onSubmit as void Function(String)?,
        obscureText: obscure,
        focusNode: focusNode,
        initialValue: initialValue,
        enabled: !disable,
        controller: controller,
        textInputAction: inputAction,
        keyboardType: inputType,
        validator: validator,
        autofocus: autofocus,
        onTap: onTap as void Function()?,
        style: AppTextStyles.medium(),
        onChanged: onChange as void Function(String)?,
        maxLength: maxLength,
        cursorColor: AppColors.secondaryColor,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(
            isDense: false,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixText: suffixText,
            errorStyle: AppTextStyles.small(),
            counterText: '',
            icon: svgPath != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset("$svgPath",
                        color: iconColor ?? AppColors.secondaryColor,
                        width: 5.0.w,
                        height: 5.0.w),
                  )
                : null),
      ),
    );
  }
}
