import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/date_pickers.dart';
import 'package:foxlearn/app/presentation/registeration/widgets/edit_text_form.dart';
import 'package:foxlearn/common/utils/utils.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/strings.dart';

List<Widget> getEditTexts(context, controller, iconPassword, onEye, see) {
  final nameEditText = EditTextForm(
    validator: (text) {
      if (text == null || text.isEmpty) return AppString.FillName;
      return null;
    },
    controller: controller.userNameController,
    title: AppString.Name,
    svgPath: Assets.svgUsers,
    keyboardType: TextInputType.name,
    focusNode: controller.focusNodeName,
    nextFocusNode: controller.focusNodeLastName,
    mainContext: context,
  );

  final lasNameEditText = EditTextForm(
    controller: controller.nameController,
    title: AppString.LastName,
    svgPath: Assets.svgUsers,
    keyboardType: TextInputType.name,
    focusNode: controller.focusNodeLastName,
    nextFocusNode: controller.focusNodePhone,
    mainContext: context,
    validator: (text) {
      if (text == null || text.isEmpty) return AppString.FillLastName;
      return null;
    },
  );
  final phoneEditText = EditTextForm(
    controller: controller.phoneController,
    title: AppString.Phone,
    svgPath: Assets.svgCall,
    keyboardType: TextInputType.phone,
    focusNode: controller.focusNodePhone,
    nextFocusNode: controller.focusNodeBirthday,
    mainContext: context,
    maxNumber: 10,
    validator: (text) {
      if (text == null || text.length < 10) return AppString.FillPhone;
      return null;
    },
  );
  final phoneBirthdayText = EditTextForm(
    controller: controller.birthdayController,
    title: AppString.Birthday,
    svgPath: Assets.svgCalendar,
    tap: () => showDataPicker(context, controller),
    keyboardType: TextInputType.datetime,
    focusNode: controller.focusNodeBirthday,
    nextFocusNode: controller.focusNodeEmail,
    mainContext: context,
    validator: (text) {
      if (text == null || text.isEmpty) return AppString.FillDate;
      return null;
    },
  );
  final emailEditText = EditTextForm(
      controller: controller.emailController,
      title: AppString.Email,
      svgPath: Assets.svgEdit,
      keyboardType: TextInputType.emailAddress,
      focusNode: controller.focusNodeEmail,
      nextFocusNode: controller.focusNodePassword,
      mainContext: context,
      validator: (String? text) {
        if (text!.isNotEmpty) {
          bool emailValid = RegExp(mailValidator).hasMatch(text);
          if (!emailValid) return AppString.FillEmail;
          return null;
        }
      });

  final passwordEditText = EditTextForm(
    controller: controller.passwordController,
    title: AppString.Password,
    svgPath: Assets.svgLock,
    isPassword: see,
    suffixIcon: IconButton(
      splashColor: Colors.transparent,
      splashRadius: 10,
      icon: iconPassword,
      onPressed: onEye,
      focusColor: AppColors.thirdColor,
    ),
    keyboardType: TextInputType.visiblePassword,
    focusNode: controller.focusNodePassword,
    mainContext: context,
    validator: (text) {
      if (text == null || text.isEmpty)
        return AppString.FillPassword1;
      else if (text.length < 6) return AppString.FillPassword2;

      return null;
    },
  );

  return [
    nameEditText,
    lasNameEditText,
    phoneEditText,
    phoneBirthdayText,
    emailEditText,
    passwordEditText
  ];
}
