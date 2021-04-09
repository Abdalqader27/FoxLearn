import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:foxlearn/controllers/app_controller.dart';
import 'package:foxlearn/tools/constant/fonts.dart';
import 'package:foxlearn/tools/constant/strings.dart';
import 'package:get/get.dart';
import 'package:get_up/Controllers/app_controller.dart';
import 'package:get_up/Helper/Routes/app_pages.dart';
import 'package:get_up/Helper/Themes/fonts.dart';
import 'package:get_up/Helper/Themes/my-theme.dart';
import 'package:get_up/Helper/Utils/Constant/strings.dart';
import 'package:get_up/Helper/Widgets/lottie_loading.dart';
import 'package:get_up/View/init_screen.dart';
import 'package:neumorphic/neumorphic.dart' as neu;

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
      getPages: AppPages.routes,
      home: InitScreen(
        child: controller.obx(
          (state) => state,
          onLoading: Scaffold(
            body: Center(child: LottieLoading()),
          ),
        ),
      ),
    );
  }
}
