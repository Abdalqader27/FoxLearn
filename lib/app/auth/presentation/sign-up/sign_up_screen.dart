import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:foxlearn/app/auth/presentation/bloc/auth_event.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/sgin_up_form.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/widgets/sign_up_background.dart';
import 'package:foxlearn/generated/assets.dart';
import 'package:foxlearn/injections/_injections.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Title Section-----------------------------------------

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () {
          serviceLocator<AuthBloc>().add(LogoutEvent());
          return Future.value(false);
        },
        child: SafeArea(
          child: Stack(
            children: [
              SignUpBackground(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0,
                child: Column(
                  // physics: BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 5.0.h,
                    ),
                    SvgPicture.asset(
                      Assets.svgSignUp,
                      width: 50.0.w,
                      height: 20.0.h,
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Expanded(child: _signUpSection(context))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpSection(BuildContext context) {
    serviceLocator<AuthBloc>().add(DecrementEvent(0));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
      child: SignUpForm(),
    );
  }
}
