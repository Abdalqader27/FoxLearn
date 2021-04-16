import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/tools/theme/colors.dart';
import 'package:foxlearn/views/welcome/components/welcome_background_image.dart';
import 'package:foxlearn/views/welcome/components/welcome_button.dart';

import 'components/welcome_title.dart';

class WelcomeScreen extends HookWidget
    with BackgroundImage, WelcomeTitle, WelcomeButtons {
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
