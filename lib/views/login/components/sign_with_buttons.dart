import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/tools/constant/media-path.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/theme/text_styles.dart';
import 'package:foxlearn/tools/widgets/rounded_button.dart';

class SignWithButtons {
  List<Widget> signWithButtons() => [
        RoundedButton(
            borderColor: AppColors.kDarkBlue,
            color: AppColors.kDarkBlue,
            myChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(faceBook),
                  Text("With Face Book",
                      style: kSmallTextStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ))
                ])),
        RoundedButton(
            color: Colors.white,
            borderColor: AppColors.kSomo,
            myChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(google),
                  Text("sConGoogleSignUp", style: kSmallTextStyle)
                ]))
      ];
}
