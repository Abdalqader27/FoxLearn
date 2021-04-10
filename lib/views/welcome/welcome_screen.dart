import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/tools/constant/fonts.dart';
import 'package:foxlearn/tools/constant/strings.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/translations/cupertion_picker_languages.dart';
import 'package:foxlearn/views/login/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:language_pickers/language_picker_cupertino.dart';
import 'package:language_pickers/languages.dart';
import 'package:language_pickers/utils/utils.dart';

class WelcomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Positioned(
              left: 50,
              right: 50,
              top: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Hello'.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
                  Text('Nice to meet you '.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset("assets/svg/fox_group.svg")),
          Align(
              child: Container(
                margin: EdgeInsets.all(50),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: TextButton.icon(
                          onPressed: () => {},
                          icon: Icon(Icons.arrow_back),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              'Start'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          style: TextButton.styleFrom(
                              enableFeedback: true,
                              primary: AppColors.Black15,
                              animationDuration: Duration(milliseconds: 1000),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: AppColors.primaryColor),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: 10,
                          width: 10,
                        ),
                      ),
                      Flexible(
                        child: TextButton.icon(
                          onPressed: () =>
                              PickerLanguages.openCupertinoLanguagePicker(
                                  context),
                          icon: Icon(Icons.language,
                              color: AppColors.Black15.withOpacity(.8)),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              'Select language'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          style: TextButton.styleFrom(
                              enableFeedback: true,
                              primary: AppColors.Black15,
                              animationDuration: Duration(milliseconds: 1000),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter)
        ],
      ),
    );
  }
}
