import 'package:foxlearn/app/presentation/root/root_screen.dart';
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
    )
  ];
}
