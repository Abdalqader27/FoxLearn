import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/app/auth/presentation/welcome/widgets/welcome_background_image.dart';
import 'package:foxlearn/app/auth/presentation/welcome/widgets/welcome_button.dart';
import 'package:foxlearn/app/auth/presentation/welcome/widgets/welcome_title.dart';
import 'package:foxlearn/resources/theme/colors.dart';

class WelcomeScreen extends HookWidget with BackgroundImage, WelcomeTitle, WelcomeButtons {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Stack(
            children: [
              welcomeTitle(),
              imageBackground(),
              buttons(context),
            ],
          ),
        ),
      );
}
