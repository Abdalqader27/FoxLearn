import 'package:flutter/material.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/theme/text_styles.dart';
import 'package:foxlearn/tools/widgets/circle_widget.dart';
import 'package:foxlearn/tools/widgets/rounded_button.dart';
import 'package:get/get.dart';

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
                  child: Icon(Icons.arrow_forward_ios))),
        ),
      );

  Widget welcomeTitle() => Align(
      alignment: Alignment.center,
      child: Text('Welcome Login!', style: kBigTextStyle));

  Widget textOrMail() => Text("Or By Mail",
      style: kSmallTextStyle.copyWith(color: AppColors.kGrey));

  Widget signInButton() => RoundedButton(
      borderColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      myChild: Text("sLog",
          style: kSmallTextStyle.copyWith(color: AppColors.Black15)),
      onTap: () => {});
}
