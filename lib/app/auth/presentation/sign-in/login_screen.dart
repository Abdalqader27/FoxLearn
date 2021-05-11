import 'package:flutter/material.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/widgets/login-background.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login_implements.dart';

/// ->  A
class LoginScreen extends StatelessWidget with LoginImplements {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            LoginBackground(),
            Column(
              // shrinkWrap: true,
              // physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 5.0.h),
                imageLogin,
                SizedBox(height: 2.0.h),
                Expanded(child: loginSection())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
