import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foxlearn/resources/theme/colors.dart';
import 'package:foxlearn/resources/theme/fonts.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'common/app_router/pages.dart';
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
    return ResponsiveSizer(
      builder: (_, __, ___) => GetMaterialApp(
        getPages: getPages,
        navigatorObservers: [BotToastNavigatorObserver()],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar', 'SY')],
        locale: Locale('ar', 'SY'),
        debugShowCheckedModeBanner: false,
        title: 'FoxLearn App',
        theme: ThemeData(
          fontFamily: AppFonts.sstArabicFont,
          backgroundColor: AppColors.White,
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.secondaryColor,
        ),
      ),
    );
  }
}
