import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn/app/presentation/widgets/rounded_button.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/values/paths.dart';


class SignWithButtons {
  List<Widget> signWithButtons() => [
        RoundedButton(
            borderColor: AppColors.kDarkBlue,
            color: AppColors.kDarkBlue,
            myChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppPaths.faceBook),
                  Text("With Face Book",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ))
                ]), onTap: () {  },),
        RoundedButton(
            color: Colors.white,
            borderColor: AppColors.kSomo,
            myChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppPaths.google),
                  Text("With Google",)
                ]), onTap: () {  },)
      ];
}
