import 'package:foxlearn/app/presentation/root/root_screen.dart';
import 'package:foxlearn/app/presentation/welcome/sgin_in/sign_in_screen.dart';
import 'package:foxlearn/app/presentation/welcome/welcome_screen.dart';
import 'package:foxlearn/injections/bindings/root_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => RootScreen(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInScreen(),
    ),
  ];
}
