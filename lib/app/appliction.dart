import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foxlearn/app/presentation/check_app_version/check_app_version.dart';
import 'package:foxlearn/common/router/app_pages.dart';
import 'package:foxlearn/my_app.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/fonts.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => GetMaterialApp(
        enableLog: true,
        debugShowCheckedModeBanner: false,
        title: "Fox Learn",
        // initialBinding: HomeBinding(),

        /// Transaction mode ---------------------------
        defaultTransition: Transition.fade,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        navigatorKey: Catcher.navigatorKey,

        /// Theme and localizations ---------------------
        theme: ThemeData(
          fontFamily: AppFonts.sstArabicFont,
          backgroundColor: AppColors.scaffoldBackground,
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
        ),
        themeMode: ThemeMode.light,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations
              .delegate, // Add global cupertino localiztions.
        ],
        supportedLocales: [Locale('ar', 'SY')],
        locale: Locale('ar', 'SY'),

        /// Page Sections -----------------
        /// -----------------
        getPages: AppPages.routes,
       // home: CheckAppVersion(builder: () => MyApp()),
        home:  MyApp( ),
      ),
    );
  }
}