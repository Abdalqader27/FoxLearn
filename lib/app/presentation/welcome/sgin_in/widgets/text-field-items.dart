import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/common/widgets/custom_switch.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'auth_text_filed.dart';
import 'call-dialog-function.dart';

List<Widget> getEditTexts(context,
    {phoneController, phoneNode, passwordController, passwordNode, rememberLogin}) {
  _unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordNode);
  }

  String? _lengthValidate(String? value) {
    if (value?.trim().length == 0) return "    الرجاء ادخال بياناتك";
    return null;
  }

  final firstTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgProfile,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "اسم المستخدم",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final nameTextField = AuthTextFormFiled(
      controller: phoneController,
      focusNode: phoneNode,
      maxLength: 10,
      inputType: TextInputType.text,
      inputAction: TextInputAction.next,
      onSubmit: (_) => _unFocus(context),
      validator: (value) => _lengthValidate(value)
      //  serviceLocator<LoginFacadeService>().checkValidPhone(value)
      );

  final secondTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgUnlock,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "كلمة المرور",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final passwordTextField = AuthTextFormFiled(
      controller: passwordController,
      focusNode: passwordNode,
      obscure: true,
      inputAction: TextInputAction.send,
      onSubmit: (_) {},
      validator: _lengthValidate);

  final lastRow = Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.symmetric(vertical: 2.0.w),
    // width: 33.0.w,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomSwitch(
              value: rememberLogin.value,
              onChanged: (bool value) => rememberLogin.value = value,
              activeColor: AppColors.RED,
            ),
            SizedBox(width: 1.0.h),
            Text(
              'تذكر كلمة المرور',
              style: AppTextStyles.medium().copyWith(fontSize: 10.0.sp),
            )
          ],
        ),
        GestureDetector(
            onTap: () => callDialog(context),
            child: Text(
              'نسيت كلمة السر؟',
              style: AppTextStyles.medium().copyWith(fontSize: 10.0.sp),
            )),
      ],
    ),
  );

  return [
    firstTitle,
    nameTextField,
    SizedBox(height: 2.0.h),
    secondTitle,
    passwordTextField,
    lastRow,
    SizedBox(height: 3.0.h),
  ];
}
