import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_event.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/translations/cupertion_picker_languages.dart';
import 'package:get/get.dart';

class WelcomeButtons {
  /// get this
  Widget buttons(context) => Align(
      child: Container(
          margin: EdgeInsets.all(50),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                startButton(context),
                Flexible(child: SizedBox(height: 10, width: 10)),
                selectLangPickerButton(context)
              ]))),
      alignment: Alignment.bottomCenter);

  /// Start button -------------------------------------------------------------------------------------------------

  Widget startButton(context) => Flexible(
          child: TextButton.icon(
        // onPressed: () => Get.to(() => SignInScreen()),
        icon: Icon(Icons.arrow_back),
        label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text('Start'.tr, style: TextStyle(fontWeight: FontWeight.bold))),
        style: TextButton.styleFrom(
            elevation: 0.5,
            enableFeedback: true,
            primary: AppColors.Black15,
            animationDuration: Duration(milliseconds: 1000),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: AppColors.primaryColor),
        onPressed: () {
          serviceLocator<AuthBloc>()..add(CheckAuthEvent());
        },
      ));

  /// select languages  using null safety library --------------------------------------------------------------
  Widget selectLangPickerButton(context) => Flexible(
        child: TextButton.icon(
          onPressed: () => PickerLanguages.openCupertinoLanguagePicker(context),
          icon: Icon(Icons.language, color: AppColors.Black15.withOpacity(.8)),
          label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text('Select language'.tr, style: TextStyle(fontWeight: FontWeight.bold))),
          style: TextButton.styleFrom(
              enableFeedback: true,
              primary: AppColors.Black15,
              elevation: 1 / 2,
              animationDuration: Duration(milliseconds: 1000),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: AppColors.primaryColor),
        ),
      );
}
