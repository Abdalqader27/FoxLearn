import 'package:foxlearn/app/app_widget.dart';
import 'package:foxlearn/app/auth/presentation/sign-in/login_screen.dart';
import 'package:foxlearn/app/auth/presentation/sign-up/sign_up_screen.dart';
import 'package:foxlearn/app/intro/presentation/intro_screen.dart';
import 'package:foxlearn/app/root/presentation/root/root_screen.dart';
import 'package:get/get.dart';

final getPages = <GetPage>[
  GetPage(name: AppRoutes.INTRO, page: () => IntroScreen()),
  GetPage(name: AppRoutes.LOGIN, page: () => LoginScreen()),
  GetPage(name: AppRoutes.SIGN_UP, page: () => SignUpScreen()),
  GetPage(name: AppRoutes.ROOT, page: () => RootScreen()),
  GetPage(name: AppRoutes.APP, page: () => AppWidget()),
];

class AppRoutes {
  static const String INTRO = '/';
  static const String LOGIN = '/login';
  static const String APP = '/app';
  static const String SIGN_UP = '/sign_up';
  static const String ROOT = '/app.root';
}
