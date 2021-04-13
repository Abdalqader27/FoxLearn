import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/tools/constant/media-path.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/tools/theme/text_styles.dart';
import 'package:foxlearn/tools/widgets/circle_widget.dart';
import 'package:foxlearn/tools/widgets/primary_background.dart';
import 'package:foxlearn/tools/widgets/rounded_button.dart';
import 'package:foxlearn/tools/widgets/rounded_text_field.dart';
import 'package:foxlearn/views/login/sign_imp.dart';

// ignore: must_be_immutable
class SignInScreen extends HookWidget with SignImpl {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  List<Widget> buttons() => [
        RoundedButton(
          borderColor: AppColors.kDarkBlue,
          color: AppColors.kDarkBlue,
          myChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(faceBook),
              Text("sConFaceSignUp",
                  style: kSmallTextStyle.copyWith(color: Colors.white)),
            ],
          ),
        ),
        RoundedButton(
          color: Colors.white,
          borderColor: AppColors.kSomo,
          myChild: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(google),
              Text("sConGoogleSignUp", style: kSmallTextStyle),
            ],
          ),
        ),
      ];

  List<RoundedTextField> textFields() => [
        RoundedTextField(
          iconVisibility: false,
          controller: _emailController,
          onTyping: validateEmail,
          obscureText: false,
          hint: 'Email Address',
          color: AppColors.White,
          borderColor: AppColors.White,
          icon: Icon(Icons.check, color: Colors.green),
          textInputType: TextInputType.emailAddress,
        ),
        RoundedTextField(
          iconVisibility: true,
          onTapIcon: changeVisibilityOfPassword,
          controller: _passwordController,
          onTyping: null,
          obscureText: true,
          icon: Icon(Icons.visibility),
          textInputType: TextInputType.number,
          hint: 'Password',
          color: AppColors.White,
          borderColor: AppColors.White,
        )
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PrimaryBackground(
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(parent:AlwaysScrollableScrollPhysics() ),
                padding: EdgeInsets.only(left: 50, right: 50, top: 150),
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text('Welcome Back!', style: kBigTextStyle)),
                  SizedBox(height: 20),
                  Column(children: buttons()),
                  SizedBox(height: 30),
                  Align(
                      alignment: Alignment.center,
                      child: Material(
                          child: Text("sOrLogSignUp",
                              style: kSmallTextStyle.copyWith(
                                  color: AppColors.kGrey)))),
                  Column(children: textFields()),
                  RoundedButton(
                      borderColor: AppColors.primaryColor,
                      color: AppColors.primaryColor,
                      myChild: Text("sLog",
                          style: kSmallTextStyle.copyWith(color: AppColors.Black15)),
                      onTap: () => Navigator.pushNamed(context, '/WelcomePage')),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.center,
                      child: Text("forgotSignIn", style: kSmallTextStyle)),
                  SizedBox(height: 50),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("haveSignUpIn",
                        style: kSmallTextStyle.copyWith(color: AppColors.kGrey)),
                    Material(
                        child: InkWell(
                            child: Text(":",
                                style: kSmallTextStyle.copyWith(
                                    color: AppColors.primaryColor)),
                            onTap: () =>
                                Navigator.pushNamed(context, '/SignUpPage')))
                  ]),
                  SizedBox(height: 20),
                  SvgPicture.asset(line2),
                ],
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Circle(
                          dim: 15.0,
                          onTap: () => Navigator.pop(context),
                          backGroundColor: Colors.white,
                          borderColor: AppColors.kSomo,
                          child: Icon(Icons.arrow_forward_ios))),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
