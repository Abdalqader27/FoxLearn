import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foxlearn/tools/widgets/primary_background.dart';
import 'package:foxlearn/views/login/components/sign_imp_widget.dart';
import 'package:foxlearn/views/login/components/sign_with_buttons.dart';

import 'components/sign_text_filed.dart';

class SignInScreen extends HookWidget
    with SignWithButtons, TextFieldSignIn, SignImpWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: PrimaryBackground(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 50, right: 50, top: 150),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      welcomeTitle(),
                      SizedBox(height: 20),
                      Column(children: signWithButtons()),
                      SizedBox(height: 30),
                      textOrMail(),
                      Column(children: textFields()),
                      signInButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                backButton(),
              ],
            ),
          ),
        ),
      );
}
