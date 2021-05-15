import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/presentation/widgets/circle_widget.dart';
import 'package:foxlearn/app/presentation/widgets/rounded_button.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/text_styles.dart';
import 'package:foxlearn/resources/values/keys.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignImpWidget {
  Widget backButton() => Positioned(
        top: 60,
        left: 10,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
              alignment: Alignment.topLeft,
              child: Circle(
                  dim: 15.0,
                  onTap: () => Get.back(),
                  backGroundColor: Colors.white,
                  borderColor: AppColors.kSomo,
                  widthOfBorder: 1,
                  child: Icon(Icons.arrow_forward_ios))),
        ),
      );

  Widget welcomeTitle() =>
      Align(alignment: Alignment.center, child: Text('Welcome Login!'));

  Widget textOrMail() =>
      Text("Or By Mail", style: TextStyle(color: AppColors.kGrey));

  Widget signInButton() => RoundedButton(
      borderColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      myChild: Text("Login", style: TextStyle(color: AppColors.Black15)),
      onTap: () async{
        await GetStorage().write(AppKeys.LOGIN_FLAG_KEY, true);
        Get.find<AppController>().login();
      });
}
