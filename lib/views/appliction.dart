import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foxlearn/controllers/app_controller.dart';
import 'package:foxlearn/tools/constant/fonts.dart';
import 'package:foxlearn/tools/constant/strings.dart';
import 'package:foxlearn/tools/widgets/lottie_loading.dart';
import 'package:foxlearn/views/welcome/welcome_screen.dart';
import 'package:get/get.dart';

class Application extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AppController>(() => AppController());
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: AppString().projectName,

      /// Transaction mode ---------------------------
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      navigatorKey: Catcher.navigatorKey,

      /// Theme and localizations ---------------------
      theme: ThemeData(fontFamily: AppFonts.sstArabicFont),
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Add global cupertino localiztions.
      ],
      supportedLocales: [Locale('ar', 'SY')],
      locale: Locale('ar', 'SY'),

      /// Page Sections ----------------------------------
      home: controller.obx(
        //    (state) => state,
        (state) => WelcomeScreen(),
        onLoading: Scaffold(body: Center(child: LottieLoading())),
      ),
    );
  }
}
