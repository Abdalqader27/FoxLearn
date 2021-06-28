import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/common/helpers/validation_helper.dart';
import 'package:foxlearn/common/widgets/auth_text_filed.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


List<Widget> getTextFieldItems(
    BuildContext context, TextEditingController activeCodeController) {
  final firstTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgActiveCode,
        height: 15.0.sp,
        color: AppColors.LIGHT_BLACK,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "كود التفعيل",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );

  final activeCodeTextField = AuthTextFormFiled(
      controller: activeCodeController,
      maxLength: 10,
      autoFocus: false,
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      onSubmit: (_) {
        FocusScope.of(context).unfocus();
      },
      validator: ValidationHelper.lengthValidate);
  return [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.h),
      child: firstTitle,
    ),
    Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0.h),
        child: activeCodeTextField)
  ];
}
