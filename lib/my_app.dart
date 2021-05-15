import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foxlearn/app/controllers/app_controller/app_controller.dart';
import 'package:foxlearn/app/controllers/intro_controller.dart';
import 'package:foxlearn/app/controllers/root_controller.dart';
import 'package:foxlearn/app/presentation/intro/intro_screen.dart';
import 'package:foxlearn/app/presentation/root/root_screen.dart';
import 'package:foxlearn/common/router/app_pages.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/fonts.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/presentation/welcome/welcome_screen.dart';
import 'common/services/notifications_fireBase.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseNotification(context: context).setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return Obx(() {
      late final Widget nextWidget;
      controller.appState.value.when(
        loggedIn: () {
          Get.lazyPut(() => RootController());
          nextWidget = RootScreen();
        },
        loggedOut: () {
          nextWidget = WelcomeScreen();
        },
        intro: () {
          Get.lazyPut(() => IntroController());
          nextWidget = IntroScreen();
        },
        loading: () {
          nextWidget = Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
      return nextWidget;
    });
  }
}
