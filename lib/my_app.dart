import 'package:flutter/material.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/presentation/root/root_screen.dart';
import 'package:get/get.dart';

import 'app/presentation/intro/intro_screen.dart';
import 'app/presentation/registeration/sign_in/sign_in.dart';
import 'app/presentation/widgets/lottie_loading.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(() {
      late final Widget nextWidget;
      controller.appState.value.when(
        loggedIn: () {
          nextWidget = RootScreen();
        },
        loggedOut: () {
          nextWidget = SignIn();
        },
        intro: () {
          nextWidget = IntroScreen();
        },
        loading: () {
          nextWidget = Scaffold(
            body: Center(
              child: LottieLoading(),
            ),
          );
        },
      );
      return nextWidget;
    });
  }
}
