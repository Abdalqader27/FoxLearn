import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/widgets/auth_text_filed.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/buttom_sheet_areas.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/sgin_up_form.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'gender.dart';

List<Widget> getEditTextsFirstPage(context,
    {nameController,
    nameNode,
    phoneController,
    phoneNode,
    required ValueNotifier<GenderCollege> genderCollege}) {
  _unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(phoneNode);
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
        "اسم والكنية",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final nameTextField = AuthTextFormFiled(
      controller: nameController,
      focusNode: nameNode,
      maxLength: 10,
      inputType: TextInputType.text,
      inputAction: TextInputAction.done,
      onSubmit: (_) => _unFocus(context),
      validator: (value) => serviceLocator<AuthBloc>().loginFacadeService.checkTextField(value));

  final secondTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgCall,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "رقم الموبايل",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final phoneTextField = AuthTextFormFiled(
      controller: phoneController,
      focusNode: phoneNode,
      obscure: false,
      inputAction: TextInputAction.done,
      onSubmit: (_) {},
      validator: (value) => serviceLocator<AuthBloc>().loginFacadeService.checkValidPhone(value));

  final thirdTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgUsers,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "الجنس",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final Widget radioGender = Center(
      child: Container(
          width: 200.0.w,
          child: GenderRadioButton(
            onFemaleButton: () => genderCollege.value =
                GenderCollege(gender: true, selectedCollege: genderCollege.value.selectedCollege),
            onMaleButton: () => genderCollege.value =
                GenderCollege(gender: false, selectedCollege: genderCollege.value.selectedCollege),
            currentGender: genderCollege.value.gender,
          )));

  return [
    firstTitle,
    nameTextField,
    SizedBox(height: 2.0.h),
    secondTitle,
    phoneTextField,
    SizedBox(height: 2.0.h),
    thirdTitle,
    radioGender,
    SizedBox(height: 5.0.h),
  ];
}

List<Widget> getEditTextsSecondPage(context,
    {emailController,
    emailNode,
    passwordController,
    collegeController,
    passwordNode,
    required ValueNotifier<GenderCollege> genderCollege}) {
  _unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordNode);
  }

  final firstTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgMessage,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "البريد الإلكتروني",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final emailTextField = AuthTextFormFiled(
      controller: emailController,
      focusNode: emailNode,
      maxLength: 100,
      inputType: TextInputType.emailAddress,
      inputAction: TextInputAction.done,
      onSubmit: (_) => _unFocus(context),
      validator: (value) => serviceLocator<AuthBloc>().loginFacadeService.checkValidEmail(value));

  final secondTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgUnlock,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "كلمة السر",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final passwordTextField = AuthTextFormFiled(
      controller: passwordController,
      focusNode: passwordNode,
      obscure: true,
      inputAction: TextInputAction.done,
      onSubmit: (_) {},
      validator: (value) => serviceLocator<AuthBloc>().loginFacadeService.checkTextField(value));

  final thirdTitle = Row(
    children: [
      SvgPicture.asset(
        Assets.svgPaper,
        height: 15.0.sp,
        width: 15.0.sp,
      ),
      SizedBox(width: 2.0.w),
      Text(
        "الكلية التابعة لها",
        textAlign: TextAlign.right,
        style: AppTextStyles.medium(),
      ),
    ],
  );
  final Widget collegeTextField = GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) => BottomSheetAreas(
                selectedCollage: genderCollege, collegeController: collegeController));
      },
      child: AuthTextFormFiled(
          disable: true, controller: collegeController, onSubmit: (_) {}, validator: (value) {}));

  return [
    firstTitle,
    emailTextField,
    SizedBox(height: 2.0.h),
    secondTitle,
    passwordTextField,
    SizedBox(height: 2.0.h),
    thirdTitle,
    collegeTextField,
    SizedBox(height: 5.0.h),
  ];
}
